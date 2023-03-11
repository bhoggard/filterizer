from django.db import models
import datetime


class Neighborhood(models.Model):
    name = models.CharField(max_length=100)

    class Meta:
        ordering = ('name',)

    def __str__(self):
        return self.name


class Venue(models.Model):
    neighborhood = models.ForeignKey(Neighborhood, on_delete=models.CASCADE)
    name = models.CharField(max_length=255)
    address = models.CharField(max_length=255)
    website = models.URLField()

    @property
    def neighborhood_name(self):
        return self.neighborhood.name

    class Meta:
        ordering = ('name',)

    def __str__(self):
        return self.name


class Event(models.Model):
    title = models.CharField(max_length=255)
    venue = models.ForeignKey(Venue, on_delete=models.CASCADE)
    start_date = models.DateField(db_index=True)
    end_date = models.DateField(db_index=True)
    website = models.URLField(blank=True)

    class Meta:
        ordering = ('-end_date',)

    def __str__(self):
        return self.title

    def neighborhood(self):
        return self.venue.neighborhood.name

    def url(self):
        return self.website.strip() or self.venue.website

    @classmethod
    def now(cls):
        """Return Events that are open now, organized by Neighborhood"""
        hood_list = []
        # today = datetime.datetime.now().date()
        # for hood in Neighborhood.objects.all().order_by('name'):
        #     events = Event.objects.filter(
        #         venue__neighborhood=hood,
        #         start_date__lte=today,
        #         end_date__gte=today
        #     ).order_by('end_date')
        #     if len(events) > 0:
        #         hood_list.append([hood, list(events)])
        return hood_list
