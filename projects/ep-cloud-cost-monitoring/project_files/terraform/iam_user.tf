resource "aws_iam_user" "komiser_iam" {
  name = "komiser-aws-user"

  tags = {
    Name = "aws-komiser"
  }
}

# For UI login
resource "aws_iam_user_login_profile" "komiser_iam_login" {
 user    = aws_iam_user.komiser_iam.name
}
output "iam_password" {
 value = aws_iam_user_login_profile.komiser_iam_login.password
}

# for access key & secret access key
resource "aws_iam_access_key" "komiser_iam" {
  user    = aws_iam_user.komiser_iam.name
}

output "id"{
  value = aws_iam_access_key.komiser_iam.id
}
output "secret"{
  value = aws_iam_access_key.komiser_iam.secret
  sensitive = true
}