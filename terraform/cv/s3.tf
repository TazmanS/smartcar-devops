resource "aws_s3_bucket" "cv_models" {
  bucket = "smartcar-cv-models"
}

resource "aws_s3_object" "yolo11n" {
  bucket = aws_s3_bucket.cv_models.id
  key    = "models/yolo11n.pt"
  source = "${path.module}/models/yolo11n.pt"
}
