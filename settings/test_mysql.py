from test_sqlite import *  # NOQA

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'USER': 'root',
        'PASSWORD': '',
        'NAME': 'django',
        'HOST': 'mysql-db',
        'TEST': {
            'CHARSET': 'UTF8MB4',
        },
    },
    'other': {
        'ENGINE': 'django.db.backends.mysql',
        'USER': 'root',
        'PASSWORD': '',
        'NAME': 'django2',
        'HOST': 'mysql-db',
        'TEST': {
            'CHARSET': 'UTF8MB4',
        },
    },
}

# Use a fast hasher to speed up tests.
PASSWORD_HASHERS = [
    'django.contrib.auth.hashers.MD5PasswordHasher',
]
