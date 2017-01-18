#ifndef js_cpucfg___
#define js_cpucfg___

/* AUTOMATICALLY GENERATED - DO NOT EDIT */

#undef  IS_LITTLE_ENDIAN
#define IS_BIG_ENDIAN 1

#ifdef __hppa
# define JS_STACK_GROWTH_DIRECTION (1)
#else
# define JS_STACK_GROWTH_DIRECTION (-1)
#endif
#endif /* js_cpucfg___ */
