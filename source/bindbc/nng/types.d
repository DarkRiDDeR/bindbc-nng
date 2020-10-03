//        Copyright DarkRiDDeR (Roman Barinov) 2020.
// Distributed under the Boost Software License, Version 1.0.
//       (See accompanying file LICENSE or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.nng.types;


public import core.stdc.stdint: int8_t, uint8_t, int16_t, uint16_t, int32_t, uint32_t, int64_t, uint64_t;


extern (C) @trusted @nogc nothrow align(1):

/**
 nng.h:
*/
enum {
    NNG_MAJOR_VERSION = 1,
    NNG_MINOR_VERSION = 1,
    NNG_PATCH_VERSION = 1,
    NNG_RELEASE_SUFFIX = "",
    NNG_MAXADDRLEN = 128
}

struct nng_ctx {
    uint32_t id;
}

struct nng_dialer {
    uint32_t id;
}

struct nng_listener {
    uint32_t id;
}

struct nng_pipe {
    uint32_t id;
}

struct nng_socket {
    uint32_t id;
}

alias nng_duration = int32_t; // in milliseconds
struct nng_msg;
struct nng_stat;
struct nng_aio;

enum {
    NNG_PIPE_INITIALIZER = nng_pipe( 0 ),
    NNG_SOCKET_INITIALIZER = nng_socket( 0 ),
    NNG_DIALER_INITIALIZER = nng_dialer ( 0 ),
    NNG_LISTENER_INITIALIZER = nng_listener( 0 ),
    NNG_CTX_INITIALIZER = nng_ctx ( 0 )
}

struct nng_sockaddr_inproc {
    uint16_t sa_family;
    char[NNG_MAXADDRLEN] sa_name;
}

struct nng_sockaddr_path {
    uint16_t sa_family;
    char[NNG_MAXADDRLEN] sa_path;
}

struct nng_sockaddr_in6 {
    uint16_t sa_family;
    uint16_t sa_port;
    uint8_t[16] sa_addr;
}
alias nng_sockaddr_udp6 = nng_sockaddr_in6;
alias nng_sockaddr_tcp6 = nng_sockaddr_in6;

struct nng_sockaddr_in {
    uint16_t sa_family;
    uint16_t sa_port;
    uint32_t sa_addr;
}

struct nng_sockaddr_zt {
    uint16_t sa_family;
    uint64_t sa_nwid;
    uint64_t sa_nodeid;
    uint32_t sa_port;
}
alias nng_sockaddr_udp = nng_sockaddr_in;
alias nng_sockaddr_tcp = nng_sockaddr_in;

align(1) union nng_sockaddr {
    uint16_t            s_family;
    nng_sockaddr_path   s_ipc;
    nng_sockaddr_inproc s_inproc;
    nng_sockaddr_in6    s_in6;
    nng_sockaddr_in     s_in;
    nng_sockaddr_zt     s_zt;
}

package enum nng_sockaddr_family {
    AF_UNSPEC = 0,
    AF_INPROC = 1,
    AF_IPC    = 2,
    AF_INET   = 3,
    AF_INET6  = 4,
    AF_ZT     = 5 // ZeroTier
}
alias NNG_SOCKADDR_FAMILY = nng_sockaddr_family;

struct nng_iov {
    void * iov_buf;
    size_t iov_len;
}

enum {
    NNG_DURATION_INFINITE = -1,
    NNG_DURATION_DEFAULT = -2,
    NNG_DURATION_ZERO = 0
}

enum nng_pipe_ev {
    ADD_PRE,  // Called just before pipe added to socket
    ADD_POST, // Called just after pipe added to socket
    REM_POST, // Called just after pipe removed from socket
    NUM,      // Used internally, must be last.
}
alias NNG_PIPE_EV = nng_pipe_ev;

alias nng_pipe_cb = void delegate (nng_pipe, nng_pipe_ev, void *);
alias nng_aio_cancelfn = void delegate (nng_aio *, void *, int);

enum nng_flag_enum {
    ALLOC    = 1,
    NONBLOCK = 2
}
alias NNG_FLAG = nng_flag_enum; 

enum {
    NNG_OPT_SOCKNAME = "socket-name",
    NNG_OPT_RAW = "raw",
    NNG_OPT_PROTO = "protocol",
    NNG_OPT_PROTONAME = "protocol-name",
    NNG_OPT_PEER = "peer",
    NNG_OPT_PEERNAME = "peer-name",
    NNG_OPT_RECVBUF = "recv-buffer",
    NNG_OPT_SENDBUF = "send-buffer",
    NNG_OPT_RECVFD = "recv-fd",
    NNG_OPT_SENDFD = "send-fd",
    NNG_OPT_RECVTIMEO = "recv-timeout",
    NNG_OPT_SENDTIMEO = "send-timeout",
    NNG_OPT_LOCADDR = "local-address",
    NNG_OPT_REMADDR = "remote-address",
    NNG_OPT_URL = "url",
    NNG_OPT_MAXTTL = "ttl-max",
    NNG_OPT_RECVMAXSZ = "recv-size-max",
    NNG_OPT_RECONNMINT = "reconnect-time-min",
    NNG_OPT_RECONNMAXT = "reconnect-time-max",
    NNG_OPT_TLS_CONFIG = "tls-config",
    NNG_OPT_TLS_AUTH_MODE = "tls-authmode",
    NNG_OPT_TLS_CERT_KEY_FILE = "tls-cert-key-file",
    NNG_OPT_TLS_CA_FILE = "tls-ca-file",
    NNG_OPT_TLS_SERVER_NAME = "tls-server-name",
    NNG_OPT_TLS_VERIFIED = "tls-verified",
    NNG_OPT_TCP_NODELAY = "tcp-nodelay",
    NNG_OPT_TCP_KEEPALIVE = "tcp-keepalive",
    NNG_OPT_TCP_BOUND_PORT = "tcp-bound-port",
    NNG_OPT_IPC_SECURITY_DESCRIPTOR = "ipc:security-descriptor",
    NNG_OPT_IPC_PERMISSIONS = "ipc:permissions",
    NNG_OPT_IPC_PEER_UID = "ipc:peer-uid",
    NNG_OPT_IPC_PEER_GID = "ipc:peer-gid",
    NNG_OPT_IPC_PEER_PID = "ipc:peer-pid",
    NNG_OPT_IPC_PEER_ZONEID = "ipc:peer-zoneid",
    NNG_OPT_WS_REQUEST_HEADERS = "ws:request-headers",
    NNG_OPT_WS_RESPONSE_HEADERS = "ws:response-headers",
    NNG_OPT_WS_RESPONSE_HEADER = "ws:response-header:",
    NNG_OPT_WS_REQUEST_HEADER = "ws:request-header:",
    NNG_OPT_WS_REQUEST_URI = "ws:request-uri",
    NNG_OPT_WS_SENDMAXFRAME = "ws:txframe-max",
    NNG_OPT_WS_RECVMAXFRAME = "ws:rxframe-max",
    NNG_OPT_WS_PROTOCOL = "ws:protocol"
}

package enum nng_stat_type_enum {
    SCOPE   = 0, // Stat is for scoping, and carries no value
    LEVEL   = 1, // Numeric "absolute" value, diffs meaningless
    COUNTER = 2, // Incrementing value (diffs are meaningful)
    STRING  = 3, // Value is a string
    BOOLEAN = 4, // Value is a boolean
    ID      = 5, // Value is a numeric ID
}
alias NNG_STAT = nng_stat_type_enum;

package enum nng_unit_enum {
    NONE     = 0, // No special units
    BYTES    = 1, // Bytes, e.g. bytes sent, etc.
    MESSAGES = 2, // Messages, one per message
    MILLIS   = 3, // Milliseconds
    EVENTS   = 4  // Some other type of event
}
alias NNG_UNIT = nng_unit_enum;

package enum nng_errno_enum {
    EINTR        = 1,
    ENOMEM       = 2,
    EINVAL       = 3,
    EBUSY        = 4,
    ETIMEDOUT    = 5,
    ECONNREFUSED = 6,
    ECLOSED      = 7,
    EAGAIN       = 8,
    ENOTSUP      = 9,
    EADDRINUSE   = 10,
    ESTATE       = 11,
    ENOENT       = 12,
    EPROTO       = 13,
    EUNREACHABLE = 14,
    EADDRINVAL   = 15,
    EPERM        = 16,
    EMSGSIZE     = 17,
    ECONNABORTED = 18,
    ECONNRESET   = 19,
    ECANCELED    = 20,
    ENOFILES     = 21,
    ENOSPC       = 22,
    EEXIST       = 23,
    EREADONLY    = 24,
    EWRITEONLY   = 25,
    ECRYPTO      = 26,
    EPEERAUTH    = 27,
    ENOARG       = 28,
    EAMBIGUOUS   = 29,
    EBADTYPE     = 30,
    ECONNSHUT    = 31,
    EINTERNAL    = 1000,
    ESYSERR      = 0x10000000,
    ETRANERR     = 0x20000000
}
alias NNG_ERRNO = nng_errno_enum;

struct nng_url {
    char *u_rawurl;   // never NULL
    char *u_scheme;   // never NULL
    char *u_userinfo; // will be NULL if not specified
    char *u_host;     // including colon and port
    char *u_hostname; // name only, will be "" if not specified
    char *u_port;     // port, will be "" if not specified
    char *u_path;     // path, will be "" if not specified
    char *u_query;    // without '?', will be NULL if not specified
    char *u_fragment; // without '#', will be NULL if not specified
    char *u_requri;   // includes query and fragment, "" if not specified
}

struct nng_stream;
struct nng_stream_dialer;
struct nng_stream_listener;


/**
 compat/nanomsg/bus.h
*/
enum {
    NN_PROTO_BUS = 7,
    NN_BUS = (NN_PROTO_BUS * 16 + 0)
}


/**
 compat/nanomsg/inproc.h
*/
enum NN_INPROC = -1;


/**
 compat/nanomsg/ipc.h
*/
enum {
    NN_IPC = -2,
    NN_IPC_SEC_ATTR = 1,
    NN_IPC_OUTBUFSZ = 2,
    NN_IPC_INBUFSZ = 3,
}


/**
 compat/nanomsg/nn.h
*/
enum {
    AF_SP = 1,
    AF_SP_RAW = 2,
    NN_SOCKADDR_MAX = 128,
    NN_SOL_SOCKET = 0,
    NN_DONTWAIT = 1,
    PROTO_SP = 1,
    SP_HDR = 1,
}

// Errnos.
public import core.stdc.errno;

// Socket options
enum {
    NN_LINGER = 1,
    NN_SNDBUF = 2,
    NN_RCVBUF = 3,
    NN_SNDTIMEO = 4,
    NN_RCVTIMEO = 5,
    NN_RECONNECT_IVL = 6,
    NN_RECONNECT_IVL_MAX = 7,
    NN_SNDPRIO = 8,
    NN_RCVPRIO = 9,
    NN_SNDFD = 10,
    NN_RCVFD = 11,
    NN_DOMAIN = 12,
    NN_PROTOCOL = 13,
    NN_IPV4ONLY = 14,
    NN_SOCKET_NAME = 15,
    NN_RCVMAXSIZE = 16,
    NN_MAXTTL = 17
}

// Poll stuff
enum {
    NN_POLLIN = 1,
    NN_POLLOUT = 2
}

struct nn_pollfd {
	int      fd;
	uint16_t events;
	uint16_t revents;
}

struct nn_iovec {
    void * iov_base;
    size_t iov_len;
}

struct nn_msghdr {
	nn_iovec*        msg_iov;
	int              msg_iovlen;
	void *           msg_control;
	size_t           msg_controllen;
}

struct nn_cmsghdr {
    size_t cmsg_len;
    int    cmsg_level;
    int    cmsg_type;
}

/**
  rewritten from lambda syntax because libdparse does not recognise alias to a lambda
  and docs won't be built because adrdox depends on it
*/
pragma(inline)
auto NN_CMSG_ALIGN_ (long len)
{
    return (len + size_t.sizeof - 1) & cast(size_t) ~(size_t.sizeof - 1);
}

/// posix-defined msghdr manipulation
pragma(inline)
auto NN_CMSG_FIRSTHDR(T)(T* mhdr)
{
    return nn_cmsg_next (cast(nn_msghdr*) mhdr, null);
}

/// posix-defined msghdr manipulation
pragma(inline)
auto NN_CMSG_NXTHDR(T,U)(T* mhdr, U*cmsg)
{
    return nn_cmsg_next (cast(nn_msghdr*) mhdr, cast(nn_cmsghdr*) cmsg);
}

/// posix-defined msghdr manipulation
pragma(inline)
ubyte* NN_CMSG_DATA(T)(T* cmsg)
{
    return cast(ubyte*) ((cast(nn_cmsghdr*) cmsg) + 1);
}

/// Extension to POSIX defined by RFC 3542.
pragma(inline)
auto NN_CMSG_SPACE(size_t len)
{
    return (NN_CMSG_ALIGN_ (len) + NN_CMSG_ALIGN_ (nn_cmsghdr.sizeof));
}

/// Extension to POSIX defined by RFC 3542.
pragma(inline)
auto NN_CMSG_LEN(size_t len)
{
    return (NN_CMSG_ALIGN_ (nn_cmsghdr.sizeof) + (len));
}

enum NN_MSG = size_t.max;


/**
 compat/nanomsg/pair.h
*/
enum {
    NN_PROTO_PAIR = 1,
    NN_PAIR = (NN_PROTO_PAIR * 16 + 0),
    NN_PAIR_v0 = (NN_PROTO_PAIR * 16 + 0),
    NN_PAIR_V1 = (NN_PROTO_PAIR * 16 + 1)
}


/**
 compat/nanomsg/pipeline.h
*/
enum {
    NN_PROTO_PIPELINE = 5,
    NN_PUSH = (NN_PROTO_PIPELINE * 16 + 0),
    NN_PULL = (NN_PROTO_PIPELINE * 16 + 1)
}


/**
 compat/nanomsg/pubsub.h
*/
enum {
    NN_PROTO_PUBSUB = 2,
    NN_PUB = (NN_PROTO_PUBSUB * 16 + 0),
    NN_SUB = (NN_PROTO_PUBSUB * 16 + 1),
    NN_SUB_SUBSCRIBE = (NN_SUB * 16 + 1),
    NN_SUB_UNSUBSCRIBE = (NN_SUB * 16 + 2),
}


/**
 compat/nanomsg/reqrep.h
*/
enum {
    NN_PROTO_REQREP = 3,
    NN_REQ = (NN_PROTO_REQREP * 16 + 0),
    NN_REP = (NN_PROTO_REQREP * 16 + 1),
    NN_REQ_RESEND_IVL = (NN_REQ * 16 + 1)
}


/**
 compat/nanomsg/survey.h
*/
enum {
    NN_PROTO_SURVEY = 6,
    NN_SURVEYOR = (NN_PROTO_SURVEY * 16 + 2),
    NN_RESPONDENT = (NN_PROTO_SURVEY * 16 + 3),
    NN_SURVEYOR_DEADLINE = (NN_SURVEYOR * 16 + 1)
}


/**
 compat/nanomsg/tcp.h
*/
enum {
    NN_TCP = -3,
    NN_TCP_NODELAY = 1
}


/**
 compat/nanomsg/ws.h
*/
enum {
    NN_WS = -4,
    NN_WS_MSG_TYPE = 1,
    NN_WS_MSG_TYPE_TEXT = 0x1,
    NN_WS_MSG_TYPE_BINARY = 0x2,
}


/**
 protocol/pair1/pair1.h
*/
enum NNG_OPT_PAIR1_POLY = "pair1:polyamorous";


/**
 protocol/pubsub0/sub.h
*/
enum {
    NNG_OPT_SUB_SUBSCRIBE = "sub:subscribe",
    NNG_OPT_SUB_UNSUBSCRIBE = "sub:unsubscribe",
    NNG_OPT_SUB_PREFNEW = "sub:prefnew"
}


/**
 protocol/reqrep0/req.h
*/
enum NNG_OPT_REQ_RESENDTIME = "req:resend-time";


/**
 protocol/survey0/survey.h
*/
enum NNG_OPT_SURVEYOR_SURVEYTIME = "surveyor:survey-time";


/**
 supplemental/http/http.h
*/
struct nng_tls_config;

// HTTP status codes.  This list is not exhaustive.
package enum nng_http_status {
    CONTINUE                 = 100,
    SWITCHING                = 101,
    PROCESSING               = 102,
    OK                       = 200,
    CREATED                  = 201,
    ACCEPTED                 = 202,
    NOT_AUTHORITATIVE        = 203,
    NO_CONTENT               = 204,
    RESET_CONTENT            = 205,
    PARTIAL_CONTENT          = 206,
    MULTI_STATUS             = 207,
    ALREADY_REPORTED         = 208,
    IM_USED                  = 226,
    MULTIPLE_CHOICES         = 300,
    STATUS_MOVED_PERMANENTLY = 301,
    FOUND                    = 302,
    SEE_OTHER                = 303,
    NOT_MODIFIED             = 304,
    USE_PROXY                = 305,
    TEMPORARY_REDIRECT       = 307,
    PERMANENT_REDIRECT       = 308,
    BAD_REQUEST              = 400,
    UNAUTHORIZED             = 401,
    PAYMENT_REQUIRED         = 402,
    FORBIDDEN                = 403,
    NOT_FOUND                = 404,
    METHOD_NOT_ALLOWED       = 405,
    NOT_ACCEPTABLE           = 406,
    PROXY_AUTH_REQUIRED      = 407,
    REQUEST_TIMEOUT          = 408,
    CONFLICT                 = 409,
    GONE                     = 410,
    LENGTH_REQUIRED          = 411,
    PRECONDITION_FAILED      = 412,
    PAYLOAD_TOO_LARGE        = 413,
    ENTITY_TOO_LONG          = 414,
    UNSUPPORTED_MEDIA_TYPE   = 415,
    RANGE_NOT_SATISFIABLE    = 416,
    EXPECTATION_FAILED       = 417,
    TEAPOT                   = 418,
    UNPROCESSABLE_ENTITY     = 422,
    LOCKED                   = 423,
    FAILED_DEPENDENCY        = 424,
    UPGRADE_REQUIRED         = 426,
    PRECONDITION_REQUIRED    = 428,
    TOO_MANY_REQUESTS        = 429,
    HEADERS_TOO_LARGE        = 431,
    UNAVAIL_LEGAL_REASONS    = 451,
    INTERNAL_SERVER_ERROR    = 500,
    NOT_IMPLEMENTED          = 501,
    BAD_GATEWAY              = 502,
    SERVICE_UNAVAILABLE      = 503,
    GATEWAY_TIMEOUT          = 504,
    HTTP_VERSION_NOT_SUPP    = 505,
    VARIANT_ALSO_NEGOTIATES  = 506,
    INSUFFICIENT_STORAGE     = 507,
    LOOP_DETECTED            = 508,
    NOT_EXTENDED             = 510,
    NETWORK_AUTH_REQUIRED    = 511,
}
alias NNG_HTTP_STATUS = nng_http_status;

struct nng_http_req;
struct nng_http_res;
struct nng_http_conn;
struct nng_http_handler;
struct nng_http_server;
struct nng_http_client;


/**
 supplemental/tls/tls.h
*/
package enum nng_tls_mode {
	CLIENT = 0,
	SERVER = 1,
}
alias NNG_TLS_MODE = nng_tls_mode;

package enum nng_tls_auth_mode {
	NONE     = 0, // No verification is performed
	OPTIONAL = 1, // Verify cert if presented
	REQUIRED = 2, // Verify cert, close if invalid
}
alias NNG_TLS_AUTH_MODE = nng_tls_auth_mode;

/**
 supplemental/util/options.h
*/
struct nng_optspec {
    const char *o_name;  // Long style name (may be NULL for short only)
    int         o_short; // Short option (no clustering!)
    int         o_val;   // Value stored on a good parse (>0)
    bool        o_arg;   // Option takes an argument if true
}


/**
 supplemental/util/platform.h
*/
alias nng_time = uint64_t ;
struct nng_thread;
struct nng_mtx;
struct nng_cv;


/**
 transport/ws/websocket.h
*/
alias NNG_OPT_WSS_REQUEST_HEADERS = NNG_OPT_WS_REQUEST_HEADERS;
alias NNG_OPT_WSS_RESPONSE_HEADERS = NNG_OPT_WS_RESPONSE_HEADERS;


/**
 transport/zerotier/zerotier.h
*/
enum {
    NNG_OPT_ZT_HOME = "zt:home",
    NNG_OPT_ZT_NWID = "zt:nwid",
    NNG_OPT_ZT_NODE = "zt:node",
    NNG_OPT_ZT_NETWORK_STATUS = "zt:network-status",
    NNG_OPT_ZT_NETWORK_NAME = "zt:network-name",
    NNG_OPT_ZT_PING_TIME = "zt:ping-time",
    NNG_OPT_ZT_PING_TRIES = "zt:ping-tries",
    NNG_OPT_ZT_CONN_TIME = "zt:conn-time",
    NNG_OPT_ZT_CONN_TRIES = "zt:conn-tries",
    NNG_OPT_ZT_MTU = "zt:mtu",
    NNG_OPT_ZT_ORBIT = "zt:orbit",
    NNG_OPT_ZT_DEORBIT = "zt:deorbit",
    NNG_OPT_ZT_ADD_LOCAL_ADDR = "zt:add-local-addr",
    NNG_OPT_ZT_CLEAR_LOCAL_ADDRS = "zt:clear-local-addrs"
}

package enum nng_zt_status {
	UP,
	CONFIG,
	DENIED,
	NOTFOUND,
	ERROR,
	OBSOLETE,
	UNKNOWN,
}
alias NNG_ZT_STATUS = nng_zt_status;
