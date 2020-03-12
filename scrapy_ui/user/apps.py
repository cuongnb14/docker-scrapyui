from django.apps import AppConfig


class UserConfig(AppConfig):
    name = 'scrapy_ui.user'
    verbose_name = "Users"

    def ready(self):
        """Override this to put in:
            Users system checks
            Users signal registration
        """
        pass
