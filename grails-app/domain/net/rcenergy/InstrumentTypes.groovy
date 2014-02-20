package net.rcenergy

class InstrumentTypes {
	String instrumentType
	
    static mapping = {
		sort "instrumentType"
    }
	String toString() {
		instrumentType
	}
}
