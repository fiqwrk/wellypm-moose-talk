use Test::More;
use Test::Exception;
use Person; 

my $person = 
throws_ok
	{ Person->new({ name=>12, age=>'Raf', peers=>['apple'] }) }
        qr/Attribute \(age\).*type constraint.*: Validation failed for 'Int' with value Raf/,
	'Should barf on illegal types';
done_testing;
