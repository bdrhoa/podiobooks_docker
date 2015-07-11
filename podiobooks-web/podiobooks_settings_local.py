DATABASES = {
        "default": {
            "ENGINE": 'django.db.backends.postgresql_psycopg2',
            "NAME": "postgres",
            "USER": "podiobooks",
            "PASSWORD": "podiobooks",
            "HOST": "db",
            "PORT": "5432"
        }
    }
DEBUG = False
ALLOWED_HOSTS=['.cyface.com', '.podiobooks.com', '127.0.0.1']
