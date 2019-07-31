def simple_time_ago(mins)
  
  if mins >= 60
    "#{mins / 60} hours ago"
  elsif mins <= 1
    "just a moment ago"
  else
    "#{mins} minutes ago"
  end
end

get '/' do
  
  @finstagram_post_stella = {
    username: "stella:)",
   
    avatar_url: "https://pre00.deviantart.net/10d8/th/pre/f/2018/242/f/7/untitled_by_03nenaisa-dcllgdo.jpg",
    
    time_ago: simple_time_ago(8),
    
    photo_url: "https://media.treehugger.com/assets/images/2011/10/baby-eagle-rays.jpg",
    
    like_count: 7,
   
    comment_count: 1,
    
    comments: [{
      username: "stella:)",
      text: "Great day out with the Squaad! :) :)"
      }]
  }
  
  @finstagram_post_shark = {
    username: "sharky_j",
    avatar_url: "http://naserca.com/images/sharky_j.jpg",
    photo_url: "http://naserca.com/images/shark.jpg",
    humanized_time_ago: simple_time_ago(15),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "sharky_j",
      text: "Out for the long weekend... too embarrassed to show y'all the beach bod!"
    }]
  }

  @finstagram_post_whale = {
    username: "kirk_whalum",
    avatar_url: "http://naserca.com/images/kirk_whalum.jpg",
    photo_url: "http://naserca.com/images/whale.jpg",
    time_ago: simple_time_ago(65),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "kirk_whalum",
      text: "#weekendvibes"
    }]
  }

  @finstagram_post_marlin = {
    username: "marlin_peppa",
    avatar_url: "http://naserca.com/images/marlin_peppa.jpg",
    photo_url: "http://naserca.com/images/marlin.jpg",
    time_ago: simple_time_ago(190),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "marlin_peppa",
      text: "lunchtime! ;)"
    }]
  }
  
  @finstagram_posts = [@finstagram_post_stella, @finstagram_post_shark, @finstagram_post_whale, @finstagram_post_marlin]
  
  @finstagram_posts.to_s
  
  erb(:index)
  
end