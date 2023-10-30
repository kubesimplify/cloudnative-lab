resource "aws_iam_policy" "komiser_policy" { 
  name        = "komiser_iam_policy"
  description = "This is the policy for komiser user"

  policy = file("policy.json")

 tags = {
    Name = var.tag_name
  }
}

# Policy Attachment with the user:
resource "aws_iam_user_policy_attachment" "komiser_policy_attachment" {
 user       = aws_iam_user.komiser_iam.name
 policy_arn = aws_iam_policy.komiser_policy.arn
}