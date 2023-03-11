from rest_framework import serializers
from artcalendar.models import Neighborhood, Venue, Event


class NeighborhoodSerializer(serializers.ModelSerializer):
    class Meta:
        model = Neighborhood
        fields = ['name']


class VenueSerializer(serializers.ModelSerializer):
    class Meta:
        model = Venue
        fields = ['name', 'neighborhood_name', 'address', 'website']


class EventSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Event
        fields = ['id', 'title', 'start_date',
                  'end_date', 'url', 'venue', 'neighborhood']
