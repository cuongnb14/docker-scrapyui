build:
	docker build -t scrapy_ui:0.1 .

d-run:
	docker run -d -p 8000:8000 scrapy_ui:0.1

install-coreui:
	cd scrapy_ui/static/coreui && npm install

run:
	python3 manage.py runserver 0.0.0.0:8000

makemigrations:
	python3 manage.py makemigrations

migrate:
	python3 manage.py migrate

collectstatic:
	python3 manage.py collectstatic --noinput

createsuperuser:
	echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'admin@demo.com', 'admin');" | python3 manage.py shell