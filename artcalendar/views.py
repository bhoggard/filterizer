from rest_framework import viewsets
from .models import Neighborhood, Venue, Event
from .serializers import NeighborhoodSerializer, VenueSerializer, EventSerializer
from django.http import HttpResponse, JsonResponse


class NeighborhoodViewSet(viewsets.ReadOnlyModelViewSet):
    """
    API endpoint that allows Neighborhoods to be viewed.
    """
    queryset = Neighborhood.objects.all()
    serializer_class = NeighborhoodSerializer


class VenueViewSet(viewsets.ReadOnlyModelViewSet):
    """
    API endpoint that allows Venues to be viewed.
    """
    queryset = Venue.objects.all()
    serializer_class = VenueSerializer


class EventViewSet(viewsets.ReadOnlyModelViewSet):
    """
    API endpoint that allows Events to be viewed.
    """
    queryset = Event.objects.all()
    serializer_class = EventSerializer


def venue_detail(_, pk):
    try:
        venue = Venue.objects.get(pk=pk)
    except Venue.DoesNotExist:
        return HttpResponse(status=404)

    serializer = VenueSerializer(venue)
    return JsonResponse(serializer.data)
