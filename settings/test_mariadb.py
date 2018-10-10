DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'USER': 'root',
        'PASSWORD': '',
        'NAME': 'django',
        'HOST': 'mariadb-db',
        'TEST': {
            'CHARSET': 'utf8',
        },
    },
    'other': {
        'ENGINE': 'django.db.backends.mysql',
        'USER': 'root',
        'PASSWORD': '',
        'NAME': 'django2',
        'HOST': 'mariadb-db',
        'TEST': {
            'CHARSET': 'utf8',
        },
    },
}

# Use a fast hasher to speed up tests.
PASSWORD_HASHERS = [
    'django.contrib.auth.hashers.MD5PasswordHasher',
]
