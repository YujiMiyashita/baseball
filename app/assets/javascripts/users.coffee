$(document).on 'change', '#profile_team_id', ->
  $.ajax(
    type: 'GET'
    url: '/users/get_player'
    data: {
      team_id: $(this).val()
    }
  ).done (data) ->
    $('.player_select').html(data)
