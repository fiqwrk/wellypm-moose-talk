use Test::More;
use Test::Exception;
use Person; 

my $person = Person->new({ age=>12, peers=>['apple'] });
is('John Doh', $person->get_name);
is(2002, $person->get_year_of_birth);
isa_ok($person, 'Person');

throws_ok
	{ Person->new({ name=>12, age=>'Raf', peers=>['apple'] }) }
        qr/Validation failed for 'Int' with value \"?Raf\"?/,
	'Should barf on illegal types';

ok($person->breath, "Testing breathing");

$person->think_of([qw(space cheese trek)]);

done_testing;
