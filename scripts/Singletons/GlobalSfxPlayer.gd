extends AudioStreamPlayer

func playAudio(stream: AudioStream, pitch_scale: float = 1.0, volume_db: float = 0.0):
	set_pitch_scale(pitch_scale)
	set_volume_db(volume_db)
	set_stream(stream)
	play()
