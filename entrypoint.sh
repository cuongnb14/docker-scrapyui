#!/bin/bash
set -e
python3 manage.py migrate

cat <<EOF | python3 manage.py shell
from django.contrib.auth import get_user_model

User = get_user_model()
User.objects.filter(username='admin').exists() or User.objects.create_superuser('admin', 'admin@example.com', 'admin')
EOF

exec "$@"