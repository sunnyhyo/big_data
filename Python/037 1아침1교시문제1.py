spell_re=['r','e']
spell_serve=['s','e','r','v','e']

spell_reserve=spell_re+spell_serve


spell_reserve= spell_reserve[2:]
spell_reserve= spell_reserve.insert(0,'b')
spell_reserve= spell_reserve.insert(0,'o')

print(spell_reserve)
