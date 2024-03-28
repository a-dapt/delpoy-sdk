# deploy-buckets

Deply to A-dapt S3 Buckets

## Inputs

### `aws-region`

**Optional** AWS region to deploy to, defaults to `eu-west-1`

### `bucket`

**Required** Name of the S3 bucket to deploy to

### `directories-to-deploy`

**Optional** List of directories to deploy

### `files-to-deploy`

**Optional** List of files to deploy

### `prefix`

**Optional** S3 bucket key prefix for files to deploy, defaults to none (e.g. `my-prefix/`)

### `release`

**Required** Semantic versioning for release to deploy

### `role-to-assume`

**Required** ARN of the role to assume for deployment

## Example usage

The permissions are needed to interact with GitHub's OIDC Token endpoint. This is on the root of your workflow yaml file

```yaml
permissions:
  id-token: write
  contents: write
  statuses: write
```

The following is an example of how to use this action in a workflow:

```yaml
uses: a-dapt/deploy-bucket@v1.4
with:
  release: ${{ env.RELEASE }}
  files-to-deploy: sdk.js sdk.css
  directories-to-deploy: dist bin
  bucket: ${{ secrets.S3_BUCKET }}
  role-to-assume: ${{ secrets.AWS_ROLE_TO_ASSUME_ADAPT_CORE_PLATFORM }}
```

### Deploying to S3 with Directories

The deployment process uploads all files and directories from the specified source to an Amazon S3 bucket, organized by release and optionally, prefix. This ensures a direct replication of the source directory structure within the S3 bucket, adjusted only by the release and prefix.

Example:

Source:

```
dist/file1.js
dist/dir1/file2.js
```

In S3:

```
<release>/file1.js
<release>/dir1/file2.js

# or with a prefix
<release>/<prefix>/file1.js
<release>/<prefix>/dir1/file2.js
```

## Release

1. To release change version in the `VERSION` file and push branch to the repository
2. Merge to master
3. On master, run release make target `make release`
