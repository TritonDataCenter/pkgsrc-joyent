$NetBSD: patch-strtoll.c,v 1.1 2014/07/18 13:42:24 ryoon Exp $

--- strtoll.c.orig	2014-03-09 04:03:38.000000000 +0000
+++ strtoll.c
@@ -0,0 +1,158 @@
+#if !defined(LLONG_MAX)
+#define LLONG_MAX	0x7fffffffffffffffLL
+#endif
+
+#if !defined(LLONG_MIN)
+#define LLONG_MIN	-0x7fffffffffffffffLL-1
+#endif
+
+#if !defined(ULLONG_MAX)
+#define ULLONG_MAX	0xffffffffffffffffULL
+#endif
+
+/*-
+ * Copyright (c) 1992, 1993
+ *	The Regents of the University of California.  All rights reserved.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ * 3. All advertising materials mentioning features or use of this software
+ *    must display the following acknowledgement:
+ *	This product includes software developed by the University of
+ *	California, Berkeley and its contributors.
+ * 4. Neither the name of the University nor the names of its contributors
+ *    may be used to endorse or promote products derived from this software
+ *    without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
+ * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
+ * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+ * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
+ * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+ * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+ * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+ * SUCH DAMAGE.
+ */
+
+#if 0
+#if defined(LIBC_SCCS) && !defined(lint)
+static char sccsid[] = "@(#)strtoq.c	8.1 (Berkeley) 6/4/93";
+#endif /* LIBC_SCCS and not lint */
+
+#ifndef lint
+static const char rcsid[] =
+  "$FreeBSD$";
+#endif
+#endif
+
+#include <sys/types.h>
+
+#include <limits.h>
+#include <errno.h>
+#include <ctype.h>
+#include <stdlib.h>
+
+/*
+ * Convert a string to a long long integer.
+ *
+ * Ignores `locale' stuff.  Assumes that the upper and lower case
+ * alphabets and digits are each contiguous.
+ */
+long long
+pkgsrc_strtoll(nptr, endptr, base)
+	const char *nptr;
+	char **endptr;
+	register int base;
+{
+	register const char *s;
+	register unsigned long long acc;
+	register unsigned char c;
+	register unsigned long long qbase, cutoff;
+	register int neg, any, cutlim;
+
+	/*
+	 * Skip white space and pick up leading +/- sign if any.
+	 * If base is 0, allow 0x for hex and 0 for octal, else
+	 * assume decimal; if base is already 16, allow 0x.
+	 */
+	s = nptr;
+	do {
+		c = *s++;
+	} while (isspace(c));
+	if (c == '-') {
+		neg = 1;
+		c = *s++;
+	} else {
+		neg = 0;
+		if (c == '+')
+			c = *s++;
+	}
+	if ((base == 0 || base == 16) &&
+	    c == '0' && (*s == 'x' || *s == 'X')) {
+		c = s[1];
+		s += 2;
+		base = 16;
+	}
+	if (base == 0)
+		base = c == '0' ? 8 : 10;
+
+	/*
+	 * Compute the cutoff value between legal numbers and illegal
+	 * numbers.  That is the largest legal value, divided by the
+	 * base.  An input number that is greater than this value, if
+	 * followed by a legal input character, is too big.  One that
+	 * is equal to this value may be valid or not; the limit
+	 * between valid and invalid numbers is then based on the last
+	 * digit.  For instance, if the range for quads is
+	 * [-9223372036854775808..9223372036854775807] and the input base
+	 * is 10, cutoff will be set to 922337203685477580 and cutlim to
+	 * either 7 (neg==0) or 8 (neg==1), meaning that if we have
+	 * accumulated a value > 922337203685477580, or equal but the
+	 * next digit is > 7 (or 8), the number is too big, and we will
+	 * return a range error.
+	 *
+	 * Set any if any `digits' consumed; make it negative to indicate
+	 * overflow.
+	 */
+	qbase = (unsigned)base;
+	cutoff = neg ? (unsigned long long)-(LLONG_MIN + LLONG_MAX) + LLONG_MAX
+	    : LLONG_MAX;
+	cutlim = cutoff % qbase;
+	cutoff /= qbase;
+	for (acc = 0, any = 0;; c = *s++) {
+		if (!isascii(c))
+			break;
+		if (isdigit(c))
+			c -= '0';
+		else if (isalpha(c))
+			c -= isupper(c) ? 'A' - 10 : 'a' - 10;
+		else
+			break;
+		if (c >= base)
+			break;
+		if (any < 0 || acc > cutoff || (acc == cutoff && c > cutlim))
+			any = -1;
+		else {
+			any = 1;
+			acc *= qbase;
+			acc += c;
+		}
+	}
+	if (any < 0) {
+		acc = neg ? LLONG_MIN : LLONG_MAX;
+		errno = ERANGE;
+	} else if (neg)
+		acc = -acc;
+	if (endptr != 0)
+		*endptr = (char *)(any ? s - 1 : nptr);
+	return (acc);
+}
