type array_frame = (char, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array1.t

type 'a pixel_format            (** pixel format for retrieved data: either [rgb3] or [rgb4] *)
type rgb3                       (** use [rgb3] for instantiating this type *)
type rgb4                       (** use [rgb4] for instantiating this type *)

(** The bitmap type for the RGB frame returned from the decoder *)
type 'a rgb_array_frame = ('a, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array1.t

(** [array_of_string frame_string] converts the string frame_string to
    a sequence of bytes in array_frame *)
val array_of_string : string -> array_frame

(** Image type *)
type ('a, 'format) image = {
  image_width	   : int;
  image_height	   : int;
  image_rgb_format : 'format;
  image_data	   : 'a rgb_array_frame;
}

val rgb3 : rgb3 pixel_format
val rgb4 : rgb4 pixel_format

(** Performs the decoding, returning either an [R; G; B] array or an array with RGB values as integers. *)
external decode_char : 'rgb pixel_format -> array_frame -> (char, 'format) image option = "jpeg_decode"
external decode_int : 'rgb pixel_format -> array_frame -> (int, 'format) image option = "jpeg_decode"
