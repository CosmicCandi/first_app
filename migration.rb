require 'active_record'
require_relative 'lipsum'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'lipsum_db.sqlite3'
)

class ApplicationMigration < ActiveRecord::Migration
  def change
    create_table "lipsums", force: true do |t|
      t.text     "name"
      t.text     "paragraph"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end

ApplicationMigration.migrate(:up)

Lipsum.create(name: "bacon", paragraph: "<h3>Bacon ipsum dolor</h3> amet picanha meatball andouille alcatra ground round, beef hamburger. Swine leberkas pastrami boudin doner. Pork chop drumstick porchetta salami, shoulder pastrami spare ribs cupim tenderloin turducken filet mignon tri-tip. Pork pastrami frankfurter doner. Hamburger porchetta capicola, shoulder ribeye jerky shankle frankfurter landjaeger swine. Cupim shank landjaeger, ham rump hamburger short ribs tail pork chop. <br>", created_at: Time.now)

Lipsum.create(name: "pirate", paragraph: "<h3>Gabion Davy Jones</h3> Locker aye to go on account scurvy Buccaneer cackle fruit lugsail long boat. Run a rig belaying pin knave draught landlubber or just lubber Jolly Roger chantey grog draft. Shiver me timbers strike colors ye belaying pin chase come about barque shrouds tackle. Plate Fleet marooned rum case shot warp yo-ho-ho killick list spyglass. Landlubber or just lubber topgallant hornswaggle black spot bilge no prey, no pay broadside brigantine scurvy. Tackle Jack Tar chandler holystone loot come about Sail ho warp snow.<br><img src =\"https://s-media-cache-ak0.pinimg.com/originals/1b/56/cc/1b56cc3c34ed801a9e74fb845e0b7ffc.png\" height=\"75\" width=\"75\">")

Lipsum.create(name: "sagan", paragraph: "Hypatia. A still more glorious dawn awaits Champollion white dwarf astonishment! Hydrogen atoms radio telescope two ghostly white figures in coveralls and helmets are soflty dancing kindling the energy hidden in matter how far away? Dispassionate extraterrestrial observer Orion's sword corpus callosum something incredible is waiting to be known. Cambrian explosion, realm of the galaxies prime number at the edge of forever, rogue another world sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium? Science, finite but unbounded and billions upon billions upon billions upon billions upon billions upon billions upon billions?<br>")

# To execute this in IRB, type:
#
# require './migration'
# ApplicationMigration.migrate(:up)

# To roll this back in IRB, type:
#
# require './migration'
# ApplicationMigration.migrate(:down)
