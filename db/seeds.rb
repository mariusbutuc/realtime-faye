# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

scene_starters = [
  {
    title: %q[Int. Dojo - Night],
    content: %q[{{X}} is putting away a stack of wooden boards, straightening the pads, and tidying up the dojo after a long day of teaching karate. Suddenly, a noise makes {{X}} turn. It's {{Y}}, former prot&eacute;g&eacute;, and {{Y}} looks angry.]
  },
  {
    title: %q[Ext. Forest - Day],
    content: %q[{{X}} and {{Y}} are walking happily through the forest with their picnic basket and blankets in hand. They laugh and joke, looking forward to the delicious meal they're about to share in the great outdoors. <br /> {{X}} looks up to see clouds forming overhead; a storm is coming.]
  },
  {
    title: %q[Int. Abandoned Warehouse - Night],
    content: %q[{{X}} and {{Y}} stand together, awaiting the anonymous tipster who sent them there. {{Y}} is nervous. Suddenly all the lights flicker on. They're surrounded by dozens of armed men! {{Y}} turns to {{X}} for help, but unexpectedly, {{X}} is pointing a gun right at {{Y}}!]
  },
  {
    title: %q[Ext. Farm - Day],
    content: %q[{{X}} and {{Y}} are planting this year's crop of potatoes, now that the frost is done. As {{X}} and {{Y}} dig down into the hard, black earth, their shovels hit something solid. Confused, {{Y}} brushes away the soil and sees a large wooden box.]
  },
  {
    title: %q[Int. Shabby Living Room - Day],
    content: %q[{{X}} is walking around a rundown apartment scowling at the mess on the floor.  Garbage, clothing, plates, and other items that are begging for a wash, litter the stained carpet and furniture.  <br />{{Y}} walks in.]
  },

  {
    title: %q[Int. Sewer - Night],
    content: %q[{{X}} and {{Y}} are running through the muck that covers the sewer floor.  They check behind them, it seems like the coast is clear.  They stop for a moment to open the briefcase they've been guarding with their lives and make sure the merchandise is still safe. <br />{{X}} gasps.]
  },

  {
    title: %q[Ext. Rooftop - Night],
    content: %q[{{X}} stands alone, perched at the corner of the building, surveying the city below.  {{X}} hears a noise coming from behind, the faint flutter of a cape.  {{X}} turns to face {{Y}}, who is as silent as the night and seeking vengeance.]
  },

  {
    title: %q[Int. Science Lab - Time Machine],
    content: %q[{{X}} sits in front a humming console, crowded with dozens of flickering buttons illuminating the room.  A puff of smoke rises from the cockpit of the time-machine. <br />{{Y}} has finally returned.]
  },

  {
    title: %q[Ext. Rainforest - Day],
    content: %q[{{X}} is leading {{Y}} cautiously through the hot and humid jungle.  {{X}}'s machete hacks through foliage.  <br />They notice a small cave opening up ahead with odd markings.  {{X}} pulls out the map to confirm that this is the destination. <br />They enter the cave.]
  },

  {
    title: %q[Int. Saloon],
    content: %q[{{X}} sits at the bar sipping on a bourbon.   The doors swing open; and standing at the bar's entrance is {{Y}}, the Sherriff of the town.]
  },

  {
    title: %q[Int. Interrogation Room ],
    content: %q[{{Y}} sits in handcuffs, underneath a blinding, hot spotlight.  {{X}} circles around the room, as sweat pours down {{Y}}'s face.]
  },

  {
    title: %q[Int. Fitting Room],
    content: %q[{{X}} is trying on a variety of pants.  {{Y}} has been waiting patiently for hours.  <br />{{X}} emerges from the change room.]
  },

  {
    title: %q[Ext. Dilapidated Mansion ],
    content: %q[{{X}} and {{Y}} stand on the porch holding their suitcases.  The musty smell is overwhelming.  {{X}} knocks on the door, but there is no answer.  {{Y}} peers through the window and sees the building has been abandoned.  <br />{{X}} opens the front door.]
  },

  {
    title: %q[Ext. Soccer Field],
    content: %q[{{X}} and {{Y}} stand on the sidelines of a championship pee wee soccer game.  {{Y}} screams for a bad call.  {{X}}, frustrated by {{Y}}'s incessant nagging, shoves {{Y}}.]
  },

  {
    title: %q[Int. Doctor's Office],
    content: %q[{{X}} has been anxiously pacing the room back and forth.  The Doctor, {{Y}} opens the door to the little room holding a chart.]
  },

  {
    title: %q[Int. Xavier's Mansion],
    content: %q[{{X}} sits in a wheelchair looking quite upset.  In the background plays footage of last night's failed superhero mission. <br />{{Y}} shifts in the seat uncomfortably.]
  },

  {
    title: %q[Int. Oval Office],
    content: %q[President {{X}} is looking a top secret government CIA file.  {{Y}} bursts through the door sweating profusely from the brow.  {{X}} looks up annoyed, but knows it must be important as no one typically enters without knocking.]
  },

  {
    title: %q[Ext. Cottage],
    content: %q[{{X}} sits upon the dock, wistfully hurling small stones into the lake. <br />{{Y}} slowly walks down the dock and sits beside {{X}}.]
  },

  {
    title: %q[Int. Future Prison],
    content: %q[Robot model #X3014, given name: {{X}}, sits behind bars, waiting to be sent to Robot Death Row. <br />Suddenly, the sound of a prison door opens.  Into the cell walks, {{Y}}, Head RoboGuard.]
  }
]

pbar = ProgressBar.create( title: 'Seed Scene Starters', total: scene_starters.count, format: '%a |%b>>%i| %p%% %t [%c/%C done]')
scene_starters.each do |starter|
  Starter.create starter
  pbar.increment
end
