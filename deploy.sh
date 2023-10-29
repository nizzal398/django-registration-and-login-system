docker build -t django_app:stg .

aws configure set region us-east-1

export MYSQL_HOST="$(aws ssm get-parameter --name "/rds/endpoint" --with-decryption --query "Parameter.Value" --output text)"
export MYSQL_DB="django_app_db"
export MYSQL_PORT="3306"
export MYSQL_USER="admin"
export MYSQL_PASSWORD="$(aws ssm get-parameter --name "/rds/password" --with-decryption --query "Parameter.Value" --output text)"
export HOST_IP="$(curl http://169.254.169.254/latest/meta-data/local-ipv4)"
export ALB_ENDPOINT="$(aws ssm get-parameter --name "/app/lb" --with-decryption --query "Parameter.Value" --output text)"

docker compose down

docker compose up
