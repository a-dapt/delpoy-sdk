# deploy-buckets

Deply to A-dapt S3 Buckets

## Inputs

### `aws-region`

**Optional** AWS region to deploy to, defaults to `eu-west-1`

### `bucket`

**Required** Name of the S3 bucket to deploy to

### `files-to-deploy`

**Required** List of files to deploy separated by newlines

### `prefix`

**Optional** S3 bucket key prefix for files to deploy, defaults to none

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
uses: a-dapt/deploy-bucket@v1.1
with:
  release: ${{ env.RELEASE }}
  files-to-deploy: |
    sdk.js
    sdk.css
  bucket: ${{ secrets.S3_BUCKET }}
  role-to-assume: ${{ secrets.AWS_ROLE_TO_ASSUME_ADAPT_CORE_PLATFORM }}
```

## Release

1. To release change version in the `VERSION` file and push branch to the repository
2. Merge to master
3. On master, run release make target `make release`
