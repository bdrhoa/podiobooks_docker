DATABASES = {
        "default": {
            "ENGINE": 'django.db.backends.postgresql_psycopg2',
            "NAME": "postgres",
            "USER": "podiobooks",
            "PASSWORD": "<CHANGEME>",
            "HOST": "db",
            "PORT": "5432"
        }
    }
DEBUG_TOOLBAR_PATCH_SETTINGS = False
