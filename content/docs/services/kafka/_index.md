---
date: 2020-06-04 22:15:00.833996
title: Kafka
---
<div id="kafka" class="section">


There are Kafka brokers as central backbone for messaging. Kafka is
provided via Strimzi version 0.7.0.

Brokers live in per-environment OpenShift Dedicated projects:

  -   - Dev Cluster
        
          - platform-mq-dev – Sandbox environment
        
          - platform-mq-ci
        
          - platform-mq-qa

  -   - Prod Cluster
        
          - platform-mq-prod

<div id="connecting-to-kafka" class="section">

## Connecting to Kafka

Each environment provides a bootstrap-servers service to which producers
and consumers should connect:

  - platform-mq-dev-kafka-bootstrap.platform-mq-dev.svc.cluster.local:9092

  - platform-mq-ci-kafka-bootstrap.platform-mq-ci.svc.cluster.local:9092

  - platform-mq-qa-kafka-bootstrap.platform-mq-qa.svc.cluster.local:9092

  - platform-mq-prod-kafka-bootstrap.platform-mq-prod.svc.cluster.local:9092

As of now (Dec ‘19), clients do not need to authenticate and can use
PLAINTEXT.

More TBD

</div>

<div id="troubleshooting" class="section">

## Troubleshooting

There are a few common issues we see with Kafka, and a few common
mechanisms for resolving them.

When in doubt, determining whether the issues are in the Zookeeper nodes
or Kafka brokers and deleting all of the affected containers so the
operator can recreate them tends to resolve otherwise difficult to
resolve problems.

<div id="logs" class="section">

### Logs

Logs are being stored in Kibana, logs.insights.openshift.com and
logs.insights-dev.openshift.com but unfortunately verbose Java Garbage
Collection logging is enabled and cannot be disabled in our version. Due
to this, the logs are incredibly chatty without being particularly
useful.

Important information can still be gleaned, but will require wading
through the largely useless GC logging messages.

</div>

<div id="dashboard" class="section">

### Dashboard

<https://metrics.1b13.insights.openshiftapps.com/d/8wCTC5Tmz/strimzi-kafka>

</div>

<div id="zookeeper-quorum-failures" class="section">

### Zookeeper Quorum Failures

Due most likely to a bug in the version of Zookeeper, hiccoughs in the
zookeeper cluster/assembly tend to result in failures forming quorum.
This is most easily identified by issues connecting with Kafka without
warnings or errors being otherwise present.

Checking the Zookeeper node logs for repeated FastLeaderElection
messages that never resolve themselves is the best diagnostic indicator
of this bug.

To resolve, I’ve found that either deleting all three zookeeper nodes,
or the entire StatefulSet, and letting the Strimzi operator recreate
them allows the assembly to come up happily.

</div>

<div id="kafka-storage-full" class="section">

### Kafka Storage Full

We’ve run into full storage on the kafka brokers a few times previously,
so we’ve a few alerts tracking this one in Slack. Additionally, we’re
keeping track of a set of tunables that have thus far rendered this less
of a concern. It can still happen, though, so there’s a short-term and a
long-term fix should the alrts start going off.

In the short term, we just need to get the storage available again. This
is most easily and least disruptively done from a debug instance of the
kafka broker spawned with oc debug platform-mq-\[env\]-kafka-\[id\] .
Unfortunately, this presents its own issue, as debug pods will
occasionally fail to grab the storage before the failing-to-start pod
does. I’ve more resarch to do on getting past this but thus far I’ve
simply brute-forced my way through by having the oc command ready to
run, restarting the failing pod, and immediately running the oc debug
command. Once the pod is up, one will need to clear .log files from
/var/lib/kafka/kafka-log-\[id\]/\[topic\] . Standard Linux commands like
du can help immensely in finding what topics need to be cleaned up. This
action will need to be performed on each broker.

In short:

1.  oc debug \<kafka-broker-pod\>

2.  cd /var/lib/kafka/kafka-log-\[id\]/

3.  du -h | sort -h

4.  rm old .log files from the topic directory that is a storage use
    outlier

In the long term, fixing this requires either adding storage to the
brokers, requiring downtime and a frustrating copy process. (Made easier
by later versions of Strimzi once we can upgrade to them.) Or by
limiting the size and duration of topic data storage via Kafka’s topic
retention tunables.

</div>

<div id="broker-startup-failures" class="section">

### Broker Startup Failures

On startup, Kafka brokers need to scan through each partition on each
topic to verify and correct any offset discrepancies between the log
file stores and zookeeper data. This can be a lengthy process,
particularly as the number of partitions in our environment has grown.
This has resulted in a correspondingly lengthy startup before the Kafka
pods pass their liveness and readiness checks. Should a Kafka pod be
repeatedly restarting with messages similar to “Kafka server is still
starting up, cannot shut down\!” these timeouts likely need to be
increased further. Note that any changes to the DeployConfig or pod
directly will be overwritten by the operator, so the changes must be
made to the Kafka resource on the project, which the operator should
then use to recreate the StatefulSet and pods.

</div>

<div id="diagnostic-commands" class="section">

### Diagnostic Commands

For issues other than those outlined above, there are some Kafka
specific information gathering commands that can help give a picture of
what’s going on in the brokers. Accessing these commands will require
terminal/RSH access to the Kafka broker pods, as we don’t expose the
broker endpoints to the world outside of OSD.

Commands of Note:

  - /opt/kafka/bin/kafka-topics.sh –zookeeper localhost:2181
    
      - Information about the presence, absence, and configuration of
        Kafka topics
    
      - Accepts –list to list all topics and –topic \<topic\> –describe
        for topic specific information
    
      - –describe is particularly useful for ensuring replicas are in
        sync and that each topic’s partitions are balanced across the
        brokers

  - /opt/kafka/bin/kafka-consumer.sh –bootstrap-server localhost:9092
    
      - Information about consumer groups and consumer
    
      - Accepts –list to list all currently defined/connected consumer
        groups
    
      - Accepts –group \<group\> –describe –state for information on
        which broker is coordinating a group and how that group is
        behaving
    
      - Accepts –group \<group\> –describe for information about how
        each partition is assigned within a consumer group
    
      - Accepts a series of options relating to altering and resetting
        the offsets for a group/partition which can help some partitions
        catch up, but can also cause messages to be skipped. Use with
        care.

  - /opt/kafka/bin/kafka-console-consumer.sh and
    /opt/kafka/bin/kafka-console-producer.sh
    
      - Basic producers/consumers for testing message passing
        functionality
    
      - Accepts –bootstrap-server localhost:9092 for the server to
        connect to
    
      - Accepts –topic \<topic\> and –group \<group\> for particular
        topic and group production/consumption \* Note that producing to
        existing topics can break services that consume from those
        topics and expect a particular message format \* Note that
        consuming from a topic with a –group value that’s in use
        elsewhere can cause other consumers in that group to miss
        messages

</div>

</div>

</div>