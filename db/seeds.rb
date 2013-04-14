# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

scene_starters = [
  {
    title: 'Int. Dojo - Night',
    content: %q[{{X}} is putting away a stack of wooden boards, straightening the pads, and tidying up the dojo after a long day of teaching karate. Suddenly, a noise makes {{X}} turn. It\'s {{Y}}, former prot&eacute;g&eacute;, and {{Y}} looks angry.]
  },
  {
    title: 'Ext. Forest - Day',
    content: %q[{{X}} and {{Y}} are walking happily through the forest with their picnic basket and blankets in hand. They laugh and joke, looking forward to the delicious meal they're about to share in the great outdoors. <br /> {{X}} looks up to see clouds forming overhead; a storm is coming.]
  },
  {
    title: 'Int. Abandoned Warehouse - Night',
    content: %q[{{X}} and {{Y}} stand together, awaiting the anonymous tipster who sent them there. {{Y}} is nervous. Suddenly all the lights flicker on. They're surrounded by dozens of armed men! {{Y}} turns to {{X}} for help, but unexpectedly, {{X}} is pointing a gun right at {{Y}}!]
  },
  {
    title: 'Ext. Farm - Day',
    content: %q[{{X}} and {{Y}} are planting this year's crop of potatoes, now that the frost is done. As {{X}} and {{Y}} dig down into the hard, black earth, their shovels hit something solid. Confused, {{Y}} brushes away the soil and sees a large wooden box.]
  },
]

scene_starters.each do |starter|
  Starter.create starter
end
