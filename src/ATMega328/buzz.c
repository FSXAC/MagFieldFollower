// timer 2 ISR
#ifdef TIMER2_ENABLED
ISR(TIMER2_COMPA_vect) {
	PORTD toggle(7);
	return 0;
}
#endif