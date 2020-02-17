3.times do |topic|
	Topic.create!(
		title: "Topic #{topic}"
	)
end

puts "3 Topics created"

10.times do |blog|
	Blog.create!(
		title: "My blog post #{blog}",
		body: "What...what's going on? 
		Turn around, Chewbacca, 
		I can't see. 
		Oh...they've encased him in carbonite. 
		He should be quite well-protected - if he 
		survives the freezing process, that is. Well, Calrissian, did he survive? 
		Yes, he's alive. And in perfect hibernation. 
		He's all yours bounty hunter. 
		Reset the chamber for Skywalker. 
		Skywalker has just landed, my lord. Good. 
		See to it that he finds his way here. 
		Calrissian, take the princess and the Wookiee to my ship. 
		You said they'd be left in the city under my supervision. I am altering the deal. 
		Pray I don't alter it any further.",
		topic_id: Topic.last.id
	)
end

puts "10 blog posts created"

5.times do |skill|
	Skill.create!(
		title: "Rails #{skill}",
		percent_utilized: 30
	)
end

puts "5 skills created"

7.times do |portfolio_item|
	Portfolio.create!(
		title: "Portfolio title #{portfolio_item}",
		subtitle: "Ruby on Rails",
		body: "Ready for some power? Okay. Let's see now. 
		Put that in there. There you go. 
		Now all I have to do is find this Yoda...if he even exists.",
		main_image: "https://source.unsplash.com/random/600x400",
		thumb_image:"https://source.unsplash.com/random/350x200" 
	)
end

2.times do |portfolio_item|
	Portfolio.create!(
		title: "Portfolio title #{portfolio_item}",
		subtitle: "Angular",
		body: "Ready for some power? Okay. Let's see now. 
		Put that in there. There you go. 
		Now all I have to do is find this Yoda...if he even exists.",
		main_image: "https://source.unsplash.com/random/600x400",
		thumb_image:"https://source.unsplash.com/random/350x200" 
	)
end

puts "9 portfolios created"

3.times do |technology|
	Technology.create!(
		name: 'Technology #{technology}',
		portfolio_id: Portfolio.last.id
	)
end

puts "3 technologies created"