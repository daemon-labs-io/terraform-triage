# Bucket must be created out-of-band before `terraform init`.
# See README for the one-time bootstrap step.
#
# `key` is intentionally omitted: it is supplied per-participant at init
# time via `TF_CLI_ARGS_init=-backend-config=key=...`, set by docker-compose
# locally and by the GitHub Actions workflow in CI. This keeps each
# participant's state file isolated under participants/<id>/terraform.tfstate.
terraform {
  backend "s3" {
    bucket       = "daemon-labs-terraform-triage-state-london"
    region       = "eu-west-2"
    encrypt      = true
    use_lockfile = true
  }
}
