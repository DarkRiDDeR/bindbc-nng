//        Copyright DarkRiDDeR (Roman Barinov) 2020.
// Distributed under the Boost Software License, Version 1.0.
//       (See accompanying file LICENSE or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.nng.bindstatic;


version(BindNNG_Static):

import bindbc.nng.types;


extern (C) @trusted @nogc nothrow:

// nng.h:
void nng_fini();
int nng_close(nng_socket);
int nng_socket_id(nng_socket);
void nng_closeall();
int nng_setopt(nng_socket, const(char)* , const void *, size_t);
int nng_setopt_bool(nng_socket, const(char)* , bool);
int nng_setopt_int(nng_socket, const(char)* , int);
int nng_setopt_ms(nng_socket, const(char)* , nng_duration);
int nng_setopt_size(nng_socket, const(char)* , size_t);
int nng_setopt_uint64(nng_socket, const(char)* , uint64_t);
int nng_setopt_string(nng_socket, const(char)* , const(char)* );
int nng_setopt_ptr(nng_socket, const(char)* , void *);
int nng_getopt(nng_socket, const(char)* , void *, size_t *);
int nng_getopt_bool(nng_socket, const(char)* , bool *);
int nng_getopt_int(nng_socket, const(char)* , int *);
int nng_getopt_ms(nng_socket, const(char)* , nng_duration *);
int nng_getopt_size(nng_socket, const(char)* , size_t *);
int nng_getopt_uint64(nng_socket, const(char)* , uint64_t *);
int nng_getopt_ptr(nng_socket, const(char)* , void **);
int nng_getopt_string(nng_socket, const(char)* , char **);
int nng_socket_set(nng_socket, const(char)* , const void *, size_t);
int nng_socket_set_bool(nng_socket, const(char)* , bool);
int nng_socket_set_int(nng_socket, const(char)* , int);
int nng_socket_set_size(nng_socket, const(char)* , size_t);
int nng_socket_set_uint64(nng_socket, const(char)* , uint64_t);
int nng_socket_set_string(nng_socket, const(char)* , const(char)* );
int nng_socket_set_ptr(nng_socket, const(char)* , void *);
int nng_socket_set_ms(nng_socket, const(char)* , nng_duration);
int nng_socket_set_addr(nng_socket, const(char)* , const nng_sockaddr *);
int nng_socket_get(nng_socket, const(char)* , void *, size_t *);
int nng_socket_get_bool(nng_socket, const(char)* , bool *);
int nng_socket_get_int(nng_socket, const(char)* , int *);
int nng_socket_get_size(nng_socket, const(char)* , size_t *);
int nng_socket_get_uint64(nng_socket, const(char)* , uint64_t *);
int nng_socket_get_string(nng_socket, const(char)* , char **);
int nng_socket_get_ptr(nng_socket, const(char)* , void **);
int nng_socket_get_ms(nng_socket, const(char)* , nng_duration *);
int nng_socket_get_addr(nng_socket, const(char)* , nng_sockaddr *);
int nng_pipe_notify(nng_socket, nng_pipe_ev, nng_pipe_cb, void *);
int nng_listen(nng_socket, const(char)* , nng_listener *, int);
int nng_dial(nng_socket, const(char)* , nng_dialer *, int);
int nng_dialer_create(nng_dialer *, nng_socket, const(char)* );
int nng_listener_create(nng_listener *, nng_socket, const(char)* );
int nng_dialer_start(nng_dialer, int);
int nng_listener_start(nng_listener, int);
int nng_dialer_close(nng_dialer);
int nng_listener_close(nng_listener);
int nng_dialer_id(nng_dialer);
int nng_listener_id(nng_listener);
int nng_dialer_setopt(nng_dialer, const(char)* , const void *, size_t);
int nng_dialer_setopt_bool(nng_dialer, const(char)* , bool);
int nng_dialer_setopt_int(nng_dialer, const(char)* , int);
int nng_dialer_setopt_ms(nng_dialer, const(char)* , nng_duration);
int nng_dialer_setopt_size(nng_dialer, const(char)* , size_t);
int nng_dialer_setopt_uint64(nng_dialer, const(char)* , uint64_t);
int nng_dialer_setopt_ptr(nng_dialer, const(char)* , void *);
int nng_dialer_setopt_string(nng_dialer, const(char)* , const(char)* );
int nng_dialer_getopt(nng_dialer, const(char)* , void *, size_t *);
int nng_dialer_getopt_bool(nng_dialer, const(char)* , bool *);
int nng_dialer_getopt_int(nng_dialer, const(char)* , int *);
int nng_dialer_getopt_ms(nng_dialer, const(char)* , nng_duration *);
int nng_dialer_getopt_size(nng_dialer, const(char)* , size_t *);
int nng_dialer_getopt_sockaddr(nng_dialer, const(char)* , nng_sockaddr *);
int nng_dialer_getopt_uint64(nng_dialer, const(char)* , uint64_t *);
int nng_dialer_getopt_ptr(nng_dialer, const(char)* , void **);
int nng_dialer_getopt_string(nng_dialer, const(char)* , char **);
int nng_dialer_set(nng_dialer, const(char)* , const void *, size_t);
int nng_dialer_set_bool(nng_dialer, const(char)* , bool);
int nng_dialer_set_int(nng_dialer, const(char)* , int);
int nng_dialer_set_size(nng_dialer, const(char)* , size_t);
int nng_dialer_set_uint64(nng_dialer, const(char)* , uint64_t);
int nng_dialer_set_string(nng_dialer, const(char)* , const(char)* );
int nng_dialer_set_ptr(nng_dialer, const(char)* , void *);
int nng_dialer_set_ms(nng_dialer, const(char)* , nng_duration);
int nng_dialer_set_addr(nng_dialer, const(char)* , const nng_sockaddr *);
int nng_dialer_get(nng_dialer, const(char)* , void *, size_t *);
int nng_dialer_get_bool(nng_dialer, const(char)* , bool *);
int nng_dialer_get_int(nng_dialer, const(char)* , int *);
int nng_dialer_get_size(nng_dialer, const(char)* , size_t *);
int nng_dialer_get_uint64(nng_dialer, const(char)* , uint64_t *);
int nng_dialer_get_string(nng_dialer, const(char)* , char **);
int nng_dialer_get_ptr(nng_dialer, const(char)* , void **);
int nng_dialer_get_ms(nng_dialer, const(char)* , nng_duration *);
int nng_dialer_get_addr(nng_dialer, const(char)* , nng_sockaddr *);
int nng_listener_setopt(nng_listener, const(char)* , const void *, size_t);
int nng_listener_setopt_bool(nng_listener, const(char)* , bool);
int nng_listener_setopt_int(nng_listener, const(char)* , int);
int nng_listener_setopt_ms(nng_listener, const(char)* , nng_duration);
int nng_listener_setopt_size(nng_listener, const(char)* , size_t);
int nng_listener_setopt_uint64(nng_listener, const(char)* , uint64_t);
int nng_listener_setopt_ptr(nng_listener, const(char)* , void *);
int nng_listener_setopt_string(nng_listener, const(char)* , const(char)* );
int nng_listener_getopt(nng_listener, const(char)* , void *, size_t *);
int nng_listener_getopt_bool(nng_listener, const(char)* , bool *);
int nng_listener_getopt_int(nng_listener, const(char)* , int *);
int nng_listener_getopt_ms(nng_listener, const(char)* , nng_duration *);
int nng_listener_getopt_size(nng_listener, const(char)* , size_t *);
int nng_listener_getopt_sockaddr(nng_listener, const(char)* , nng_sockaddr *);
int nng_listener_getopt_uint64(nng_listener, const(char)* , uint64_t *);
int nng_listener_getopt_ptr(nng_listener, const(char)* , void **);
int nng_listener_getopt_string(nng_listener, const(char)* , char **);
int nng_listener_set(nng_listener, const(char)* , const void *, size_t);
int nng_listener_set_bool(nng_listener, const(char)* , bool);
int nng_listener_set_int(nng_listener, const(char)* , int);
int nng_listener_set_size(nng_listener, const(char)* , size_t);
int nng_listener_set_uint64(nng_listener, const(char)* , uint64_t);
int nng_listener_set_string(nng_listener, const(char)* , const(char)* );
int nng_listener_set_ptr(nng_listener, const(char)* , void *);
int nng_listener_set_ms(nng_listener, const(char)* , nng_duration);
int nng_listener_set_addr(nng_listener, const(char)* , const nng_sockaddr *);
int nng_listener_get(nng_listener, const(char)* , void *, size_t *);
int nng_listener_get_bool(nng_listener, const(char)* , bool *);
int nng_listener_get_int(nng_listener, const(char)* , int *);
int nng_listener_get_size(nng_listener, const(char)* , size_t *);
int nng_listener_get_uint64(nng_listener, const(char)* , uint64_t *);
int nng_listener_get_string(nng_listener, const(char)* , char **);
int nng_listener_get_ptr(nng_listener, const(char)* , void **);
int nng_listener_get_ms(nng_listener, const(char)* , nng_duration *);
int nng_listener_get_addr(nng_listener, const(char)* , nng_sockaddr *);
const(char)* nng_strerror(int);
int nng_send(nng_socket, void *, size_t, int);
int nng_recv(nng_socket, void *, size_t *, int);
int nng_sendmsg(nng_socket, nng_msg *, int);
int nng_recvmsg(nng_socket, nng_msg **, int);
void nng_send_aio(nng_socket, nng_aio *);
void nng_recv_aio(nng_socket, nng_aio *);
int nng_ctx_open(nng_ctx *, nng_socket);
int nng_ctx_close(nng_ctx);
int nng_ctx_id(nng_ctx);
void nng_ctx_recv(nng_ctx, nng_aio *);
void nng_ctx_send(nng_ctx, nng_aio *);
int nng_ctx_getopt(nng_ctx, const(char)* , void *, size_t *);
int nng_ctx_getopt_bool(nng_ctx, const(char)* , bool *);
int nng_ctx_getopt_int(nng_ctx, const(char)* , int *);
int nng_ctx_getopt_ms(nng_ctx, const(char)* , nng_duration *);
int nng_ctx_getopt_size(nng_ctx, const(char)* , size_t *);
int nng_ctx_setopt(nng_ctx, const(char)* , const void *, size_t);
int nng_ctx_setopt_bool(nng_ctx, const(char)* , bool);
int nng_ctx_setopt_int(nng_ctx, const(char)* , int);
int nng_ctx_setopt_ms(nng_ctx, const(char)* , nng_duration);
int nng_ctx_setopt_size(nng_ctx, const(char)* , size_t);
int nng_ctx_get(nng_ctx, const(char)* , void *, size_t *);
int nng_ctx_get_bool(nng_ctx, const(char)* , bool *);
int nng_ctx_get_int(nng_ctx, const(char)* , int *);
int nng_ctx_get_size(nng_ctx, const(char)* , size_t *);
int nng_ctx_get_uint64(nng_ctx, const(char)* , uint64_t *);
int nng_ctx_get_string(nng_ctx, const(char)* , char **);
int nng_ctx_get_ptr(nng_ctx, const(char)* , void **);
int nng_ctx_get_ms(nng_ctx, const(char)* , nng_duration *);
int nng_ctx_get_addr(nng_ctx, const(char)* , nng_sockaddr *);
int nng_ctx_set(nng_ctx, const(char)* , const void *, size_t);
int nng_ctx_set_bool(nng_ctx, const(char)* , bool);
int nng_ctx_set_int(nng_ctx, const(char)* , int);
int nng_ctx_set_size(nng_ctx, const(char)* , size_t);
int nng_ctx_set_uint64(nng_ctx, const(char)* , uint64_t);
int nng_ctx_set_string(nng_ctx, const(char)* , const(char)* );
int nng_ctx_set_ptr(nng_ctx, const(char)* , void *);
int nng_ctx_set_ms(nng_ctx, const(char)* , nng_duration);
int nng_ctx_set_addr(nng_ctx, const(char)* , const nng_sockaddr *);
void *nng_alloc(size_t);
void nng_free(void *, size_t);
char *nng_strdup(const(char)* );
void nng_strfree(char *);
int nng_aio_alloc(nng_aio **, void **, void *);
void nng_aio_free(nng_aio *);
void nng_aio_stop(nng_aio *);
int nng_aio_result(nng_aio *);
size_t nng_aio_count(nng_aio *);
void nng_aio_cancel(nng_aio *);
void nng_aio_abort(nng_aio *, int);
void nng_aio_wait(nng_aio *);
void nng_aio_set_msg(nng_aio *, nng_msg *);
nng_msg *nng_aio_get_msg(nng_aio *);
int nng_aio_set_input(nng_aio *, uint, void *);
void *nng_aio_get_input(nng_aio *, uint);
int nng_aio_set_output(nng_aio *, uint, void *);
void *nng_aio_get_output(nng_aio *, uint);
void nng_aio_set_timeout(nng_aio *, nng_duration);
int nng_aio_set_iov(nng_aio *, uint, const nng_iov *);
bool nng_aio_begin(nng_aio *);
void nng_aio_finish(nng_aio *, int);
void nng_aio_defer(nng_aio *, nng_aio_cancelfn, void *);
void nng_sleep_aio(nng_duration, nng_aio *);
int   nng_msg_alloc(nng_msg **, size_t);
void  nng_msg_free(nng_msg *);
int   nng_msg_realloc(nng_msg *, size_t);
void *nng_msg_header(nng_msg *);
size_t nng_msg_header_len(const nng_msg *);
void * nng_msg_body(nng_msg *);
size_t nng_msg_len(const nng_msg *);
int    nng_msg_append(nng_msg *, const void *, size_t);
int    nng_msg_insert(nng_msg *, const void *, size_t);
int    nng_msg_trim(nng_msg *, size_t);
int    nng_msg_chop(nng_msg *, size_t);
int    nng_msg_header_append(nng_msg *, const void *, size_t);
int    nng_msg_header_insert(nng_msg *, const void *, size_t);
int    nng_msg_header_trim(nng_msg *, size_t);
int    nng_msg_header_chop(nng_msg *, size_t);
int    nng_msg_header_append_u16(nng_msg *, uint16_t);
int    nng_msg_header_append_u32(nng_msg *, uint32_t);
int    nng_msg_header_append_u64(nng_msg *, uint64_t);
int    nng_msg_header_insert_u16(nng_msg *, uint16_t);
int    nng_msg_header_insert_u32(nng_msg *, uint32_t);
int    nng_msg_header_insert_u64(nng_msg *, uint64_t);
int    nng_msg_header_chop_u16(nng_msg *, uint16_t *);
int    nng_msg_header_chop_u32(nng_msg *, uint32_t *);
int    nng_msg_header_chop_u64(nng_msg *, uint64_t *);
int    nng_msg_header_trim_u16(nng_msg *, uint16_t *);
int    nng_msg_header_trim_u32(nng_msg *, uint32_t *);
int    nng_msg_header_trim_u64(nng_msg *, uint64_t *);
int    nng_msg_append_u16(nng_msg *, uint16_t);
int    nng_msg_append_u32(nng_msg *, uint32_t);
int    nng_msg_append_u64(nng_msg *, uint64_t);
int    nng_msg_insert_u16(nng_msg *, uint16_t);
int    nng_msg_insert_u32(nng_msg *, uint32_t);
int    nng_msg_insert_u64(nng_msg *, uint64_t);
int    nng_msg_chop_u16(nng_msg *, uint16_t *);
int    nng_msg_chop_u32(nng_msg *, uint32_t *);
int    nng_msg_chop_u64(nng_msg *, uint64_t *);
int    nng_msg_trim_u16(nng_msg *, uint16_t *);
int    nng_msg_trim_u32(nng_msg *, uint32_t *);
int    nng_msg_trim_u64(nng_msg *, uint64_t *);
int    nng_msg_dup(nng_msg **, const nng_msg *);
void   nng_msg_clear(nng_msg *);
void   nng_msg_header_clear(nng_msg *);
void   nng_msg_set_pipe(nng_msg *, nng_pipe);
nng_pipe nng_msg_get_pipe(const nng_msg *);
int      nng_msg_getopt(nng_msg *, int, void *, size_t *);
int nng_pipe_getopt(nng_pipe, const(char)* , void *, size_t *);
int nng_pipe_getopt_bool(nng_pipe, const(char)* , bool *);
int nng_pipe_getopt_int(nng_pipe, const(char)* , int *);
int nng_pipe_getopt_ms(nng_pipe, const(char)* , nng_duration *);
int nng_pipe_getopt_size(nng_pipe, const(char)* , size_t *);
int nng_pipe_getopt_sockaddr(nng_pipe, const(char)* , nng_sockaddr *);
int nng_pipe_getopt_uint64(nng_pipe, const(char)* , uint64_t *);
int nng_pipe_getopt_ptr(nng_pipe, const(char)* , void **);
int nng_pipe_getopt_string(nng_pipe, const(char)* , char **);
int nng_pipe_get(nng_pipe, const(char)* , void *, size_t *);
int nng_pipe_get_bool(nng_pipe, const(char)* , bool *);
int nng_pipe_get_int(nng_pipe, const(char)* , int *);
int nng_pipe_get_ms(nng_pipe, const(char)* , nng_duration *);
int nng_pipe_get_size(nng_pipe, const(char)* , size_t *);
int nng_pipe_get_uint64(nng_pipe, const(char)* , uint64_t *);
int nng_pipe_get_string(nng_pipe, const(char)* , char **);
int nng_pipe_get_ptr(nng_pipe, const(char)* , void **);
int nng_pipe_get_addr(nng_pipe, const(char)* , nng_sockaddr *);
int nng_pipe_close(nng_pipe);
int nng_pipe_id(nng_pipe);
nng_socket nng_pipe_socket(nng_pipe);
nng_dialer nng_pipe_dialer(nng_pipe);
nng_listener nng_pipe_listener(nng_pipe);
int nng_stats_get(nng_stat **);
void nng_stats_free(nng_stat *);
void nng_stats_dump(nng_stat *);
nng_stat *nng_stat_next(nng_stat *);
nng_stat *nng_stat_child(nng_stat *);
const(char)* nng_stat_name(nng_stat *);
int nng_stat_type(nng_stat *);
nng_stat *nng_stat_find(nng_stat *, const(char)* );
nng_stat *nng_stat_find_socket(nng_stat *, nng_socket);
nng_stat *nng_stat_find_dialer(nng_stat *, nng_dialer);
nng_stat *nng_stat_find_listener(nng_stat *, nng_listener);
int nng_stat_unit(nng_stat *);
uint64_t nng_stat_value(nng_stat *);
const(char)* nng_stat_string(nng_stat *);
const(char)* nng_stat_desc(nng_stat *);
uint64_t nng_stat_timestamp(nng_stat *);
int nng_device(nng_socket, nng_socket);
int nng_url_parse(nng_url **, const(char)* );
void nng_url_free(nng_url *);
int nng_url_clone(nng_url **, const nng_url *);
const(char)* nng_version();
void nng_stream_free(nng_stream *);
void nng_stream_close(nng_stream *);
void nng_stream_send(nng_stream *, nng_aio *);
void nng_stream_recv(nng_stream *, nng_aio *);
int  nng_stream_get(nng_stream *, const(char)* , void *, size_t *);
int  nng_stream_get_bool(nng_stream *, const(char)* , bool *);
int  nng_stream_get_int(nng_stream *, const(char)* , int *);
int  nng_stream_get_ms(nng_stream *, const(char)* , nng_duration *);
int  nng_stream_get_size(nng_stream *, const(char)* , size_t *);
int  nng_stream_get_uint64(nng_stream *, const(char)* , uint64_t *);
int  nng_stream_get_string(nng_stream *, const(char)* , char **);
int  nng_stream_get_ptr(nng_stream *, const(char)* , void **);
int  nng_stream_get_addr(nng_stream *, const(char)* , nng_sockaddr *);
int  nng_stream_set(nng_stream *, const(char)* , const void *, size_t);
int  nng_stream_set_bool(nng_stream *, const(char)* , bool);
int  nng_stream_set_int(nng_stream *, const(char)* , int);
int  nng_stream_set_ms(nng_stream *, const(char)* , nng_duration);
int  nng_stream_set_size(nng_stream *, const(char)* , size_t);
int  nng_stream_set_uint64(nng_stream *, const(char)* , uint64_t);
int  nng_stream_set_string(nng_stream *, const(char)* , const(char)* );
int  nng_stream_set_ptr(nng_stream *, const(char)* , void *);
int  nng_stream_set_addr(nng_stream *, const(char)* , const nng_sockaddr *);
int nng_stream_dialer_alloc(nng_stream_dialer **, const(char)* );
int nng_stream_dialer_alloc_url(nng_stream_dialer **, const nng_url *);
void nng_stream_dialer_free(nng_stream_dialer *);
void nng_stream_dialer_close(nng_stream_dialer *);
void nng_stream_dialer_dial(nng_stream_dialer *, nng_aio *);
int  nng_stream_dialer_set(nng_stream_dialer *, const(char)* , const void *, size_t);
int nng_stream_dialer_get(nng_stream_dialer *, const(char)* , void *, size_t *);
int nng_stream_dialer_get_bool(nng_stream_dialer *, const(char)* , bool *);
int nng_stream_dialer_get_int(nng_stream_dialer *, const(char)* , int *);
int nng_stream_dialer_get_ms(nng_stream_dialer *, const(char)* , nng_duration *);
int nng_stream_dialer_get_size(nng_stream_dialer *, const(char)* , size_t *);
int nng_stream_dialer_get_uint64(nng_stream_dialer *, const(char)* , uint64_t *);
int nng_stream_dialer_get_string(nng_stream_dialer *, const(char)* , char **);
int nng_stream_dialer_get_ptr(nng_stream_dialer *, const(char)* , void **);
int nng_stream_dialer_get_addr(nng_stream_dialer *, const(char)* , nng_sockaddr *);
int nng_stream_dialer_set_bool(nng_stream_dialer *, const(char)* , bool);
int nng_stream_dialer_set_int(nng_stream_dialer *, const(char)* , int);
int nng_stream_dialer_set_ms(nng_stream_dialer *, const(char)* , nng_duration);
int nng_stream_dialer_set_size(nng_stream_dialer *, const(char)* , size_t);
int nng_stream_dialer_set_uint64(nng_stream_dialer *, const(char)* , uint64_t);
int nng_stream_dialer_set_string(nng_stream_dialer *, const(char)* , const(char)* );
int nng_stream_dialer_set_ptr(nng_stream_dialer *, const(char)* , void *);
int nng_stream_dialer_set_addr(nng_stream_dialer *, const(char)* , const nng_sockaddr *);
int nng_stream_listener_alloc(nng_stream_listener **, const(char)* );
int nng_stream_listener_alloc_url(nng_stream_listener **, const nng_url *);
void nng_stream_listener_free(nng_stream_listener *);
void nng_stream_listener_close(nng_stream_listener *);
int  nng_stream_listener_listen(nng_stream_listener *);
void nng_stream_listener_accept(nng_stream_listener *, nng_aio *);
int  nng_stream_listener_set(nng_stream_listener *, const(char)* , const void *, size_t);
int nng_stream_listener_get(nng_stream_listener *, const(char)* , void *, size_t *);
int nng_stream_listener_get_bool(nng_stream_listener *, const(char)* , bool *);
int nng_stream_listener_get_int(nng_stream_listener *, const(char)* , int *);
int nng_stream_listener_get_ms(nng_stream_listener *, const(char)* , nng_duration *);
int nng_stream_listener_get_size(nng_stream_listener *, const(char)* , size_t *);
int nng_stream_listener_get_uint64(nng_stream_listener *, const(char)* , uint64_t *);
int nng_stream_listener_get_string(nng_stream_listener *, const(char)* , char **);
int nng_stream_listener_get_ptr(nng_stream_listener *, const(char)* , void **);
int nng_stream_listener_get_addr(nng_stream_listener *, const(char)* , nng_sockaddr *);
int nng_stream_listener_set_bool(nng_stream_listener *, const(char)* , bool);
int nng_stream_listener_set_int(nng_stream_listener *, const(char)* , int);
int nng_stream_listener_set_ms(nng_stream_listener *, const(char)* , nng_duration);
int nng_stream_listener_set_size(nng_stream_listener *, const(char)* , size_t);
int nng_stream_listener_set_uint64(nng_stream_listener *, const(char)* , uint64_t);
int nng_stream_listener_set_string(nng_stream_listener *, const(char)* , const(char)* );
int nng_stream_listener_set_ptr(nng_stream_listener *, const(char)* , void *);
int nng_stream_listener_set_addr(nng_stream_listener *, const(char)* , const nng_sockaddr *);


// compat/nanomsg/nn.h:
nn_cmsghdr *nn_cmsg_next(nn_msghdr *, nn_cmsghdr *);
int nn_socket(int, int);
int nn_setsockopt(int, int, int, const void *, size_t);
int nn_getsockopt(int, int, int, void *, size_t *);
int nn_bind(int, const(char)* );
int nn_connect(int, const(char)* );
int nn_shutdown(int, int);
int nn_send(int, const void *, size_t, int);
int nn_recv(int, void *, size_t, int);
int nn_sendmsg(int, const nn_msghdr *, int);
int nn_recvmsg(int, nn_msghdr *, int);
int nn_close(int);
int nn_poll(nn_pollfd *, int, int);
int nn_device(int, int);
uint64_t    nn_get_statistic(int, int);
void *      nn_allocmsg(size_t, int);
void *      nn_reallocmsg(void *, size_t);
int         nn_freemsg(void *);
int         nn_errno();
const(char)* nn_strerror(int);
void        nn_term();


// protocol/bus0/bus.h
int nng_bus0_open(nng_socket *);
int nng_bus0_open_raw(nng_socket *);
alias nng_bus_open = nng_bus0_open;
alias nng_bus_open_raw = nng_bus0_open_raw;


// protocol/pair0/pair.h
int nng_pair0_open(nng_socket *);
int nng_pair0_open_raw(nng_socket *);
//alias nng_pair_open = nng_pair0_open;
//alias nng_pair_open_raw = nng_pair0_open_raw;


// protocol/pair1/pair.h
int nng_pair1_open(nng_socket *);
int nng_pair1_open_raw(nng_socket *);
//alias nng_pair_open = nng_pair1_open;
//alias nng_pair_open_raw = nng_pair1_open_raw;

// protocol/pipeline0/pull.h
int nng_pull0_open(nng_socket *);
int nng_pull0_open_raw(nng_socket *);
alias nng_pull_open = nng_pull0_open;
alias nng_pull_open_raw = nng_pull0_open_raw;

// protocol/pipeline0/push.h
int nng_push0_open(nng_socket *);
int nng_push0_open_raw(nng_socket *);
alias nng_push_open = nng_push0_open;
alias nng_push_open_raw = nng_push0_open_raw;

// protocol/pubsub0/pub.h
int nng_pub0_open(nng_socket *);
int nng_pub0_open_raw(nng_socket *);
alias nng_pub_open = nng_pub0_open;
alias nng_pub_open_raw = nng_pub0_open_raw;

// protocol/pubsub0/sub.h
int nng_sub0_open(nng_socket *);
int nng_sub0_open_raw(nng_socket *);
alias nng_sub_open = nng_sub0_open;
alias nng_sub_open_raw = nng_sub0_open_raw;

// protocol/reqrep0/rep.h
int nng_rep0_open(nng_socket *);
int nng_rep0_open_raw(nng_socket *);
alias nng_rep_open = nng_rep0_open;
alias nng_rep_open_raw = nng_rep0_open_raw;

// protocol/reqrep0/req.h
int nng_req0_open(nng_socket *);
int nng_req0_open_raw(nng_socket *);
alias nng_req_open = nng_req0_open;
alias nng_req_open_raw = nng_req0_open_raw;

// protocol/survey0/respond.h
int nng_respondent0_open(nng_socket *);
int nng_respondent0_open_raw(nng_socket *);
alias nng_respondent_open = nng_respondent0_open;
alias nng_respondent_open_raw = nng_respondent0_open_raw;

// protocol/survey0/survey.h
int nng_surveyor0_open(nng_socket *);
int nng_surveyor0_open_raw(nng_socket *);
alias nng_surveyor_open = nng_surveyor0_open;
alias nng_surveyor_open_raw = nng_surveyor0_open_raw;

// supplemental/http/http.h
int nng_http_req_alloc(nng_http_req **, const nng_url *);
void nng_http_req_free(nng_http_req *);
const(char)* nng_http_req_get_method(nng_http_req *);
const(char)* nng_http_req_get_version(nng_http_req *);
const(char)* nng_http_req_get_uri(nng_http_req *);
int nng_http_req_set_header(nng_http_req *, const(char)* , const(char)* );
int nng_http_req_add_header(nng_http_req *, const(char)* , const(char)* );
int nng_http_req_del_header(nng_http_req *, const(char)* );
const(char)* nng_http_req_get_header(nng_http_req *, const(char)* );
int nng_http_req_set_method(nng_http_req *, const(char)* );
int nng_http_req_set_version(nng_http_req *, const(char)* );
int nng_http_req_set_uri(nng_http_req *, const(char)* );
int nng_http_req_set_data(nng_http_req *, const void *, size_t);
int nng_http_req_copy_data(nng_http_req *, const void *, size_t);
void nng_http_req_get_data(nng_http_req *, void **, size_t *);
int nng_http_res_alloc(nng_http_res **);
int nng_http_res_alloc_error(nng_http_res **, uint16_t);
void nng_http_res_free(nng_http_res *);
uint16_t nng_http_res_get_status(nng_http_res *);
int nng_http_res_set_status(nng_http_res *, uint16_t);
const(char)* nng_http_res_get_reason(nng_http_res *);
int nng_http_res_set_reason(nng_http_res *, const(char)* );
int nng_http_res_set_header(nng_http_res *, const(char)* , const(char)* );
int nng_http_res_add_header(nng_http_res *, const(char)* , const(char)* );
int nng_http_res_del_header(nng_http_res *, const(char)* );
const(char)* nng_http_res_get_header(nng_http_res *, const(char)* );
int nng_http_res_set_version(nng_http_res *, const(char)* );
const(char)* nng_http_res_get_version(nng_http_res *);
void nng_http_res_get_data(nng_http_res *, void **, size_t *);
int nng_http_res_set_data(nng_http_res *, const void *, size_t);
int nng_http_res_copy_data(nng_http_res *, const void *, size_t);
void nng_http_conn_close(nng_http_conn *);
void nng_http_conn_read(nng_http_conn *, nng_aio *);
void nng_http_conn_read_all(nng_http_conn *, nng_aio *);
void nng_http_conn_write(nng_http_conn *, nng_aio *);
void nng_http_conn_write_all(nng_http_conn *, nng_aio *);
void nng_http_conn_write_req(nng_http_conn *, nng_http_req *, nng_aio *);
void nng_http_conn_write_res(nng_http_conn *, nng_http_res *, nng_aio *);
void nng_http_conn_read_req(nng_http_conn *, nng_http_req *, nng_aio *);
void nng_http_conn_read_res(nng_http_conn *, nng_http_res *, nng_aio *);
void nng_http_req_reset(nng_http_req *);
void nng_http_res_reset(nng_http_res *);
int nng_http_handler_alloc(nng_http_handler **, const(char)* , void **);
void nng_http_handler_free(nng_http_handler *);
int nng_http_handler_alloc_file(nng_http_handler **, const(char)* , const(char)* );
int nng_http_handler_alloc_static(nng_http_handler **, const(char)* , const void *, size_t, const(char)* );
int nng_http_handler_alloc_redirect(nng_http_handler **, const(char)* , uint16_t, const(char)* );
int nng_http_handler_alloc_directory(nng_http_handler **, const(char)* , const(char)* );
int nng_http_handler_set_method(nng_http_handler *, const(char)* );
int nng_http_handler_set_host(nng_http_handler *, const(char)* );
int nng_http_handler_collect_body(nng_http_handler *, bool, size_t);
int nng_http_handler_set_tree(nng_http_handler *);
int nng_http_handler_set_data(nng_http_handler *, void *, void **);
void *nng_http_handler_get_data(nng_http_handler *);
int nng_http_server_hold(nng_http_server **, const nng_url *);
void nng_http_server_release(nng_http_server *);
int nng_http_server_start(nng_http_server *);
void nng_http_server_stop(nng_http_server *);
int nng_http_server_add_handler(nng_http_server *, nng_http_handler *);
int nng_http_server_del_handler(nng_http_server *, nng_http_handler *);
int nng_http_server_set_tls(nng_http_server *, nng_tls_config *);
int nng_http_server_get_tls(nng_http_server *, nng_tls_config **);
int nng_http_server_get_addr(nng_http_server *, nng_sockaddr *);
int nng_http_server_set_error_page(nng_http_server *, uint16_t, const(char)* );
int nng_http_server_set_error_file(nng_http_server *, uint16_t, const(char)* );
int nng_http_server_res_error(nng_http_server *, nng_http_res *);
int nng_http_hijack(nng_http_conn *);
int nng_http_client_alloc(nng_http_client **, const nng_url *);
void nng_http_client_free(nng_http_client *);
int nng_http_client_set_tls(nng_http_client *, nng_tls_config *);
int nng_http_client_get_tls(nng_http_client *, nng_tls_config **);
void nng_http_client_connect(nng_http_client *, nng_aio *);
void nng_http_conn_transact(nng_http_conn *, nng_http_req *, nng_http_res *, nng_aio *);
void nng_http_client_transact(nng_http_client *, nng_http_req *, nng_http_res *, nng_aio *);

// supplemental/tls/tls.h
int nng_tls_config_alloc(nng_tls_config **, nng_tls_mode);
void nng_tls_config_hold(nng_tls_config *);
void nng_tls_config_free(nng_tls_config *);
int nng_tls_config_server_name(nng_tls_config *, const(char)* );
int nng_tls_config_ca_chain(nng_tls_config *, const(char)* , const(char)* );
int nng_tls_config_own_cert(nng_tls_config *, const(char)* , const(char)* , const(char)* );
int nng_tls_config_key(nng_tls_config *, const uint8_t *, size_t);
int nng_tls_config_pass(nng_tls_config *, const(char)* );
int nng_tls_config_auth_mode(nng_tls_config *, nng_tls_auth_mode);
int nng_tls_config_ca_file(nng_tls_config *, const(char)* );
int nng_tls_config_cert_key_file(nng_tls_config *, const(char)* , const(char)* );

// supplemental/util/options.h
int nng_opts_parse(int argc, const(char)*  argv, const nng_optspec *opts, int *val, char **optarg, int *optidx);

// supplemental/util/platform.h
nng_time nng_clock();
void nng_msleep(nng_duration);
int nng_thread_create(nng_thread **, void **, void *);
void nng_thread_destroy(nng_thread *);
int nng_mtx_alloc(nng_mtx **);
void nng_mtx_free(nng_mtx *);
void nng_mtx_lock(nng_mtx *);
void nng_mtx_unlock(nng_mtx *);
int nng_cv_alloc(nng_cv **, nng_mtx *);
void nng_cv_free(nng_cv *);
void nng_cv_wait(nng_cv *);
int nng_cv_until(nng_cv *, nng_time);
void nng_cv_wake(nng_cv *);
void nng_cv_wake1(nng_cv *);
uint32_t nng_random();

// transport/inproc/inproc.h
int nng_inproc_register();

// transport/ipc/ipc.h
int nng_ipc_register();

// transport/tcp/tcp.h
int nng_tcp_register();

// transport/tls/tls.h
int nng_tls_register();

// transport/ws/websocket.h
int nng_ws_register();
int nng_wss_register();

// transport/zerotier/zerotier.h
int nng_zt_register();

