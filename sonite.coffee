vowels = 'aeiou'.split ''
consonants = 'bcdfghjklmnpqrstvwxyz'.split ''


Array.prototype.choice = () -> this[this.length*Math.random()|0]

sonite = (length=6) ->
  ((if i % 2 is 0 then consonants else vowels).choice() for i in [1..length]).join ''

console.log sonite()
