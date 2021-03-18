output "ecs_ami_aws_ami_id" {
  description = "AMI ID of amazon-ecs-optimize"
  value       = data.aws_ami.ecs_ami.id
}