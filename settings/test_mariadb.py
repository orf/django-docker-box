from test_sqlite import *  # NOQA

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'USER': 'root',
        'PASSWORD': '',
        'NAME': 'django',
        'HOST': 'mariadb-db',
        'TEST': {
            'CHARSET': 'UTF8MB4',
        },
    },
    'other': {
        'ENGINE': 'django.db.backends.mysql',
        'USER': 'root',
        'PASSWORD': '',
        'NAME': 'django2',
        'HOST': 'mariadb-db',
        'TEST': {
            'CHARSET': 'UTF8MB4',
        },
    },
}
