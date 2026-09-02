resource "aws_iam_user" "cv_github_actions" {
  name = "smartcar-cv-github-actions"
}

resource "aws_iam_user_policy" "cv_github_actions" {
  name = "smartcar-cv-s3-read"
  user = aws_iam_user.cv_github_actions.name

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "s3:GetObject"
        ]

        Resource = "${aws_s3_bucket.cv_models.arn}/models/*"
      }
    ]
  })
}

resource "aws_iam_access_key" "cv_github_actions" {
  user = aws_iam_user.cv_github_actions.name
}

output "cv_github_actions_access_key_id" {
  value = aws_iam_access_key.cv_github_actions.id
}

output "cv_github_actions_secret_access_key" {
  value     = aws_iam_access_key.cv_github_actions.secret
  sensitive = true
}
