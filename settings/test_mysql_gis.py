DATABASES = {
    'default': {
        'ENGINE': 'django.contrib.gis.db.backends.mysql',
        'USER': 'root',
        'PASSWORD': '',
        'NAME': 'django',
        'HOST': 'mysql-db',
        'TEST': {
            'CHARSET': 'utf8',
        },
    },
    'other': {
        'ENGINE': 'django.contrib.gis.db.backends.mysql',
        'USER': 'root',
        'PASSWORD': '',
        'NAME': 'django2',
        'HOST': 'mysql-db',
        'TEST': {
            'CHARSET': 'utf8',
        },
    },
}

# Use a fast hasher to speed up tests.
PASSWORD_HASHERS = [
    'django.contrib.auth.hashers.MD5PasswordHasher',
]
