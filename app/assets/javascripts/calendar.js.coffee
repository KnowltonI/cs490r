ready = ->
  $('#calendar').fullCalendar
    editable: true,
    header: {
      left: 'title',
      center: '',
      right: 'today prev,next'
    },
    left: 'prev,next today',
    center: 'title',
    right: 'month,agendaWeek,agendaDay'
    defaultView: 'month',
    height: 500,
    slotMinutes: 30,
    eventSources: [{
      url: '/events',
    }],
   timeFormat: 'h:mm t{ - h:mm t} ',
   dragOpacity: "0.5"
   eventDrop: (event, dayDelta, minuteDelta, allDay, revertFunc) ->
     updateEvent(event);
   eventResize: (event, dayDelta, minuteDelta, revertFunc) ->
     updateEvent(event);
   event:
     title: the_event.title,
     starts_at: "" + the_event.start,
     ends_at: "" + the_event.end,
     description: the_event.description

$(document).ready(ready)
$(document).on('page:load', ready)