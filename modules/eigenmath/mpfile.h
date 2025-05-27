
#ifndef __MICROPY_INCLUDED_PY_MPFILE_H__
#define __MICROPY_INCLUDED_PY_MPFILE_H__
#include "py/obj.h"
#include <sys/types.h>  // for off_t

// A C API for performing I/O on files or file-like objects.

typedef struct {
    mp_obj_base_t   base;
    mp_obj_t        file_obj;
    mp_obj_t        readinto_fn;
    mp_obj_t        seek_fn;
    mp_obj_t        tell_fn;
} mp_file_t;

#define MP_SEEK_SET 0
#define MP_SEEK_CUR 1
#define MP_SEEK_END 2
mp_file_t *mp_file_from_file_obj(mp_obj_t file_obj);
mp_file_t *mp_open(const char *filename, const char *mode);
mp_int_t mp_readinto(mp_file_t *file, void *buf, size_t num_bytes);
off_t mp_seek(mp_file_t *file, off_t offset, int whence);
off_t mp_tell(mp_file_t *file);
void mp_close(mp_file_t *file);
#endif // __MICROPY_INCLUDED_PY_MPFILE_H__
