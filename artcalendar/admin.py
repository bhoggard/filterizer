from django.contrib import admin

from .models import Neighborhood, Venue, Event

admin.site.register(Neighborhood)
admin.site.register(Venue)
admin.site.register(Event)
