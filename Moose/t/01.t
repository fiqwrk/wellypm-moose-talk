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

is( $person->think_of([qw(space cheese trek)]), 'censored', 'Thoughts filtered' );

$person->set_engagement_anniversary( 1407598440 );
is( $person->get_engagement_anniversary, '2014-08-09T15:34:00',
    'Engage!');

done_testing;
