/**
 * Copyright (c) 2013      Los Alamos National Security, LLC.
 *                         All rights reserved.
 */

#ifndef QUO_H_INCLUDED
#define QUO_H_INCLUDED

#ifdef HAVE_STDBOOL_H
#include <stdbool.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

struct quo_t;
typedef struct quo_t quo_t;

enum {
    QUO_SUCCESS,
    QUO_ERR,
    QUO_ERR_OOR,
    QUO_ERR_INVLD_ARG,
    QUO_ERR_CALL_BEFORE_INIT,
    QUO_ERR_TOPO
};

int
quo_version(int *version,
            int *subversion);

int
quo_init(void);

int
quo_construct(quo_t **q);

int
quo_destruct(quo_t *q);

int
quo_finalize(void);

int
quo_node_topo_emit(const quo_t *q);

int
quo_nsockets(const quo_t *q,
             int *out_nsockets);

int
quo_ncores(const quo_t *q,
           int socket,
           int *out_ncores);

int
quo_bound(const quo_t *q,
          bool *bound);

#ifdef __cplusplus
}
#endif

#endif
