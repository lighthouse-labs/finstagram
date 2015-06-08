def humanized_time_ago(time_ago_in_minutes)
  if time_ago_in_minutes >= 60
    "#{time_ago_in_minutes / 60} hours ago"
  else
    "#{time_ago_in_minutes} minutes ago"
  end
end

# home
get '/' do
  posts = [{ 
    user: {
      username: "sharky_j",
      avatar_url: "http://naserca.com/images/sharky_j.jpg"
    }, 
    photo_url: "http://naserca.com/images/shark.jpg", 
    time_ago_in_minutes: humanized_time_ago(15), 
    like_count: 12, 
    comments: [{
      user: {
        username: "sharky_j",
      },
      text: "Out for the long weekend… too embarrassed to show y’all the beach bod!"
    }, {
      user: {
        username: "mrs_sharksmith59",
      },
      text: "Joanna! Not appropriate!"
    }]
  }, {
    user: {
      username: "kirk_whalum",
      avatar_url: "http://naserca.com/images/kirk_whalum.jpg"
    }, 
    photo_url: "http://naserca.com/images/whale.jpg", 
    time_ago_in_minutes: humanized_time_ago(72), 
    like_count: 30, 
    comments: [{
      user: {
        username: "kirk_whalum",
      },
      text: "#weekendvibes"
    }]
  }, { 
    user: {
      username: "marlin_peppa",
      avatar_url: "http://naserca.com/images/marlin_peppa.jpg"
    }, 
    photo_url: "http://naserca.com/images/marlin.jpg", 
    time_ago_in_minutes: humanized_time_ago(201), 
    like_count: 28, 
    comments: [{
      user: {
        username: "marlin_peppa",
      },
      text: "lunchtime!"
    }]
  }]
  erb posts.to_s
end
