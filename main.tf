# This is the most basic terraform resource, a key and value in the SSM
# parameter store. It is a fast and easy way to test other things like github
# actions and other tooling.
#
# Note, that the tags will be populated by yor. You can delete the whole tags section
# if you want to see it in action.
#
# Note, that the value comes from a variable assigned in the tfvars files in the
# env/ directory
#
# Note that if yor updates tags, then it commits the file in the action. So
# you need to do a git pull after that becase the remote main will be one
# commit ahead of local main. If you change files before git pull, you'll
# have a ball of string to unravel (or start with a fresh git checkout)
#
#
# tag manually command
# yor tag -d . --config-file .tag_config.yml -t git_org -t git_repo -t yor_trace -i Terraform --dry-run
resource "aws_ssm_parameter" "environment_type" {
  name        = "environment_type"
  type        = "String"
  value       = "dev"
  description = "A basic SSM parameter that will vary between DEV and PROD aws accounts according to the tfvars files in the env/ directory."

  # tags will be injected below  here by yor
  # you can use the tag ChangeMeToTest to force the resource
  # to update. See tf-dev-cicd.yml

  tags = {
    git_org   = "ExampleCoSoftware"
    git_repo  = "jira-demo-iac-yor-tagging"
    yor_trace = "f9b944c2-ca1f-4b60-ba26-885bd5657ef6"
  }
}
