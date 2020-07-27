# Cloud Servies Platform Documentation

This is the core repository for the documentation for services hosted at [cloud.redhat.com](https://cloud.redhat.com).

## Setting up a development environment

1. Obtain a copy of Hugo "extended" version from the [Hugo downloads](https://github.com/gohugoio/hugo/releases). The
   extended version is required for the theme we use.

2. Clone the repository, also cloning the theme through submodules.

   ```
   git clone --recurse-submodules --depth 2 https://github.com/RedHatInsights/platform-docs
   ```

3. Install requisite npm modules for CSS assets.

   ```
   cd platform-docs
   npm install -D --save autoprefixer postcss-cli
   ```

4. Run the development server.

   ```
   hugo serve -D
   ```

## Editing with netlify-cms

You can of course edit the docs using normal git workflows.

If you have write-access to this repository, you can use Netlify CMS to edit the documentation. With your development
server running, visit `http://localhost:1313/admin/` and authorize it with your GitHub login. Be sure to make sure you
grant it access to the RedHatInsights organization. Changes you make through the Netlify CMS interface will result in
pull requests to the GitHub repository.

## Assembling dependent documentation

Many sources of documentation on the platform live elsewhere. To aggregate them all together, we use a tool called
[Aletheia](https://github.com/RedHatInsights/aletheia) to do so. To use Aletheia:

1. Make sure you have Python 3.6 installed and the [poetry](https://python-poetry.org/) package manager. On Fedora:

   ```
   sudo dnf install python36 python3-poetry 
   ```

2. Clone Aletheia from GitHub.

   ```
   git clone https://github.com/RedHatInsights/aletheia
   ```

3. Setup a Poetry environment.

   ```
   cd aletheia
   poetry install
   ```

4. Install Aletheia itself.

   ```
   poetry run python setup.py develop
   ```

5. Get Google Drive credentials to be able to access documentation hosted in
Google Drive. We know we need to improve this process, but for the moment, you
can follow the [Google Drive API Quickstart](https://developers.google.com/drive/api/v3/quickstart/python)
to obtain a `credentials.json` and `token.pickle` file. Be sure to generate your
`credentials.json` while logged into your Red Hat Google Account, not a personal one.
Put those files in the `platform-docs` directory.

6. Use Aletheia to assemble the platform docs.

   ```
   poetry run aletheia assemble
   cd /tmp/platform-docs
   hugo serve
   ```



