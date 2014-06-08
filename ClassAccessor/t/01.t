use Test::More;
use Person; 

my $person = Person->new({ name=>12, age=>'Raf', peers=>['apple'] });
isa_ok($person, 'Person');
done_testing;
