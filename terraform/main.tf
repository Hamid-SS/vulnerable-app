provider "aws" {
  region = "us-east-1"
}

# ❌ Zəiflik: S3 bucket şifrələnmədən
resource "aws_s3_bucket" "logs" {
  bucket = "my-logs-bucket"
  # Heç bir şifrələmə
}

# ❌ Zəiflik: IAM role-da hər şeyə icazə
resource "aws_iam_role" "lambda" {
  name = "lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = { Service = "lambda.amazonaws.com" }
      }
    ]
  })
}

resource "aws_iam_role_policy" "full-access" {
  name = "full-access-policy"
  role = aws_iam_role.lambda.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "*"       # ❌ Hər şeyə icazə
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

# ❌ Zəiflik: RDS public olaraq
resource "aws_db_instance" "prod" {
  allocated_storage    = 20
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "hardcoded123"  # ❌
  publicly_accessible  = true            # ❌
  skip_final_snapshot  = true            # ❌ (backup yoxdur)
}
