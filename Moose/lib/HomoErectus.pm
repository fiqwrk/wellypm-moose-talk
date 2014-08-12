use MooseX::Declare;
use HomoHabilis;

class HomoErectus extends HomoHabilis {
  has 'fire_skill' => (
	is => 'rw',
	isa => 'Bool',
        default => 1,
	predicate => 'can_burn_stuff',
  );

  method hit_smart_ape( HomoErectus $target  where {$_->can_burn_stuff} ) {
    if ($self->_rage) {
      $target->adjust_xp( -10 );
      $self->adjust_xp( +10 );
    }
  }  
}

