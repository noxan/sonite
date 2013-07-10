vowels = 'aeiou'.split ''
consonants = 'bcdfghjklmnpqrstvwxyz'.split ''


Array.prototype.choice = () -> this[this.length*Math.random()|0]

@sonite = (length=6) ->
  ([consonants, vowels][i%2].choice() for i in [1..length]).join ''
