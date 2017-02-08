#include "registrar.h"
static void native_to_managed_trampoline_1 (id self, SEL _cmd, MonoMethod **managed_method_ptr, NSNotification * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static BOOL native_to_managed_trampoline_2 (id self, SEL _cmd, MonoMethod **managed_method_ptr, void * p0, const char *r0, const char *r1, const char *r2)
{
	void * a0 = p0;
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	arg_ptrs [0] = &a0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_3 (id self, SEL _cmd, MonoMethod **managed_method_ptr, const char *r0, const char *r1)
{
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r0, r1, 0, NULL, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static UIWindow * native_to_managed_trampoline_4 (id self, SEL _cmd, MonoMethod **managed_method_ptr, const char *r0, const char *r1)
{
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	UIWindow * res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r0, r1, 0, NULL, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_lock ();
		[retobj retain];
		xamarin_framework_peer_unlock ();
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_5 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIWindow * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static BOOL native_to_managed_trampoline_6 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIApplication * p0, NSDictionary * p1, const char *r0, const char *r1, const char *r2, const char *r3)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[2] = { r0, r1 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r2, r3, 2, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, mono_class_from_mono_type (paramtype1), managed_method);
	}
	arg_ptrs [1] = mobj1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_7 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIApplication * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static id native_to_managed_trampoline_8 (id self, SEL _cmd, MonoMethod **managed_method_ptr, const char *r0, const char *r1, bool* call_super)
{
	uint8_t flags = NSObjectFlagsNativeRef;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	bool has_nsobject = xamarin_has_nsobject (self, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	if (has_nsobject) {
		*call_super = true;
		goto exception_handling;
	}
	if (!managed_method) {
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r0, r1, 0, NULL, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	mthis = mono_object_new (mono_domain_get (), mono_method_get_class (managed_method));
	xamarin_set_nsobject_handle (mthis, self);
	xamarin_set_nsobject_flags (mthis, flags);
	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);
	xamarin_create_managed_ref (self, mthis, true);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return self;
}


static UIView * native_to_managed_trampoline_9 (id self, SEL _cmd, MonoMethod **managed_method_ptr, const char *r0, const char *r1)
{
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	UIView * res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r0, r1, 0, NULL, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_lock ();
		[retobj retain];
		xamarin_framework_peer_unlock ();
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_10 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIView * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static BOOL native_to_managed_trampoline_11 (id self, SEL _cmd, MonoMethod **managed_method_ptr, const char *r0, const char *r1)
{
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r0, r1, 0, NULL, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static NSUInteger native_to_managed_trampoline_12 (id self, SEL _cmd, MonoMethod **managed_method_ptr, const char *r0, const char *r1)
{
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	NSUInteger res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r0, r1, 0, NULL, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(NSUInteger *) mono_object_unbox ((MonoObject *) retval);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static UILabel * native_to_managed_trampoline_13 (id self, SEL _cmd, MonoMethod **managed_method_ptr, const char *r0, const char *r1)
{
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	UILabel * res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r0, r1, 0, NULL, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_lock ();
		[retobj retain];
		xamarin_framework_peer_unlock ();
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_14 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UILabel * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static UIButton * native_to_managed_trampoline_15 (id self, SEL _cmd, MonoMethod **managed_method_ptr, const char *r0, const char *r1)
{
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	UIButton * res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r0, r1, 0, NULL, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_lock ();
		[retobj retain];
		xamarin_framework_peer_unlock ();
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_16 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIButton * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static UITableView * native_to_managed_trampoline_17 (id self, SEL _cmd, MonoMethod **managed_method_ptr, const char *r0, const char *r1)
{
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	UITableView * res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r0, r1, 0, NULL, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_lock ();
		[retobj retain];
		xamarin_framework_peer_unlock ();
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_18 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UITableView * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static UITextField * native_to_managed_trampoline_19 (id self, SEL _cmd, MonoMethod **managed_method_ptr, const char *r0, const char *r1)
{
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	UITextField * res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r0, r1, 0, NULL, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_lock ();
		[retobj retain];
		xamarin_framework_peer_unlock ();
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_20 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UITextField * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_21 (id self, SEL _cmd, MonoMethod **managed_method_ptr, CGRect p0, const char *r0, const char *r1, const char *r2)
{
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	arg_ptrs [0] = &p0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static UITableViewCell * native_to_managed_trampoline_22 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UITableView * p0, NSIndexPath * p1, const char *r0, const char *r1, const char *r2, const char *r3)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	UITableViewCell * res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[2] = { r0, r1 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r2, r3, 2, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, mono_class_from_mono_type (paramtype1), managed_method);
	}
	arg_ptrs [1] = mobj1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_lock ();
		[retobj retain];
		xamarin_framework_peer_unlock ();
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static NSInteger native_to_managed_trampoline_23 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UITableView * p0, NSInteger p1, const char *r0, const char *r1, const char *r2, const char *r3)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	NSInteger res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[2] = { r0, r1 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r2, r3, 2, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(NSInteger *) mono_object_unbox ((MonoObject *) retval);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static UIImageView * native_to_managed_trampoline_24 (id self, SEL _cmd, MonoMethod **managed_method_ptr, const char *r0, const char *r1)
{
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	UIImageView * res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r0, r1, 0, NULL, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_lock ();
		[retobj retain];
		xamarin_framework_peer_unlock ();
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_25 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIImageView * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static UIScrollView * native_to_managed_trampoline_26 (id self, SEL _cmd, MonoMethod **managed_method_ptr, const char *r0, const char *r1)
{
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	UIScrollView * res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r0, r1, 0, NULL, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_lock ();
		[retobj retain];
		xamarin_framework_peer_unlock ();
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_27 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIScrollView * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_28 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UITableView * p0, NSIndexPath * p1, const char *r0, const char *r1, const char *r2, const char *r3)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[2] = { r0, r1 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r2, r3, 2, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, mono_class_from_mono_type (paramtype1), managed_method);
	}
	arg_ptrs [1] = mobj1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static UISearchBar * native_to_managed_trampoline_29 (id self, SEL _cmd, MonoMethod **managed_method_ptr, const char *r0, const char *r1)
{
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	UISearchBar * res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r0, r1, 0, NULL, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_lock ();
		[retobj retain];
		xamarin_framework_peer_unlock ();
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_30 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UISearchBar * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_31 (id self, SEL _cmd, MonoMethod **managed_method_ptr, BOOL p0, const char *r0, const char *r1, const char *r2)
{
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	arg_ptrs [0] = &p0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static UIPageControl * native_to_managed_trampoline_32 (id self, SEL _cmd, MonoMethod **managed_method_ptr, const char *r0, const char *r1)
{
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	UIPageControl * res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r0, r1, 0, NULL, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_lock ();
		[retobj retain];
		xamarin_framework_peer_unlock ();
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_33 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIPageControl * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_34 (id self, SEL _cmd, MonoMethod **managed_method_ptr, NSSet * p0, UIEvent * p1, const char *r0, const char *r1, const char *r2, const char *r3)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[2] = { r0, r1 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r2, r3, 2, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, mono_class_from_mono_type (paramtype1), managed_method);
	}
	arg_ptrs [1] = mobj1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static NSInteger native_to_managed_trampoline_35 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UICollectionView * p0, NSInteger p1, const char *r0, const char *r1, const char *r2, const char *r3)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	NSInteger res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[2] = { r0, r1 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r2, r3, 2, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(NSInteger *) mono_object_unbox ((MonoObject *) retval);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static UICollectionViewCell * native_to_managed_trampoline_36 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UICollectionView * p0, NSIndexPath * p1, const char *r0, const char *r1, const char *r2, const char *r3)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	UICollectionViewCell * res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[2] = { r0, r1 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r2, r3, 2, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, mono_class_from_mono_type (paramtype1), managed_method);
	}
	arg_ptrs [1] = mobj1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_lock ();
		[retobj retain];
		xamarin_framework_peer_unlock ();
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_37 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UICollectionView * p0, NSIndexPath * p1, const char *r0, const char *r1, const char *r2, const char *r3)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[2] = { r0, r1 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r2, r3, 2, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, mono_class_from_mono_type (paramtype1), managed_method);
	}
	arg_ptrs [1] = mobj1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static UICollectionView * native_to_managed_trampoline_38 (id self, SEL _cmd, MonoMethod **managed_method_ptr, const char *r0, const char *r1)
{
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	UICollectionView * res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r0, r1, 0, NULL, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_lock ();
		[retobj retain];
		xamarin_framework_peer_unlock ();
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_39 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UICollectionView * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_40 (id self, SEL _cmd, MonoMethod **managed_method_ptr, AVCaptureOutput * p0, id p1, AVCaptureConnection * p2, const char *r0, const char *r1, const char *r2, const char *r3, const char *r4)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoType *type1;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[3] = { r0, r1, r2 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r3, r4, 3, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	type1 = xamarin_get_parameter_type (managed_method, 1);
	arg_ptrs [1] = xamarin_get_inative_object_dynamic (p1, false, mono_type_get_object (mono_domain_get (), type1), &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj2, _cmd, self, nsobj2, 2, mono_class_from_mono_type (paramtype2), managed_method);
	}
	arg_ptrs [2] = mobj2;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_41 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIAlertView * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_42 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIAlertView * p0, NSInteger p1, const char *r0, const char *r1, const char *r2, const char *r3)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[2] = { r0, r1 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r2, r3, 2, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static BOOL native_to_managed_trampoline_43 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIAlertView * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_44 (id self, SEL _cmd, MonoMethod **managed_method_ptr, NSObject * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_45 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIGestureRecognizer * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_46 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UITapGestureRecognizer * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_47 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIImagePickerController * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_48 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIImagePickerController * p0, UIImage * p1, NSDictionary * p2, const char *r0, const char *r1, const char *r2, const char *r3, const char *r4)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[3] = { r0, r1, r2 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r3, r4, 3, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, mono_class_from_mono_type (paramtype1), managed_method);
	}
	arg_ptrs [1] = mobj1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj2, _cmd, self, nsobj2, 2, mono_class_from_mono_type (paramtype2), managed_method);
	}
	arg_ptrs [2] = mobj2;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_49 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIImagePickerController * p0, NSDictionary * p1, const char *r0, const char *r1, const char *r2, const char *r3)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[2] = { r0, r1 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r2, r3, 2, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, mono_class_from_mono_type (paramtype1), managed_method);
	}
	arg_ptrs [1] = mobj1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static BOOL native_to_managed_trampoline_50 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UITextField * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static BOOL native_to_managed_trampoline_51 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UITextField * p0, NSRange p1, NSString * p2, const char *r0, const char *r1, const char *r2, const char *r3, const char *r4)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[3] = { r0, r1, r2 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r3, r4, 3, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;
	arg_ptrs [2] = p2 ? mono_string_new (mono_domain_get (), [p2 UTF8String]) : NULL;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_52 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIColor * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_53 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UISearchBar * p0, NSInteger p1, const char *r0, const char *r1, const char *r2, const char *r3)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[2] = { r0, r1 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r2, r3, 2, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static BOOL native_to_managed_trampoline_54 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UISearchBar * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static BOOL native_to_managed_trampoline_55 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UISearchBar * p0, NSRange p1, NSString * p2, const char *r0, const char *r1, const char *r2, const char *r3, const char *r4)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[3] = { r0, r1, r2 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r3, r4, 3, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;
	arg_ptrs [2] = p2 ? mono_string_new (mono_domain_get (), [p2 UTF8String]) : NULL;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_56 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UISearchBar * p0, NSString * p1, const char *r0, const char *r1, const char *r2, const char *r3)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[2] = { r0, r1 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r2, r3, 2, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = p1 ? mono_string_new (mono_domain_get (), [p1 UTF8String]) : NULL;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_57 (id self, SEL _cmd, MonoMethod **managed_method_ptr, NSObject * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, NULL, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_58 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIScrollView * p0, BOOL p1, const char *r0, const char *r1, const char *r2, const char *r3)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[2] = { r0, r1 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r2, r3, 2, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static BOOL native_to_managed_trampoline_59 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIScrollView * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static UIView * native_to_managed_trampoline_60 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIScrollView * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	UIView * res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_lock ();
		[retobj retain];
		xamarin_framework_peer_unlock ();
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_61 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIScrollView * p0, CGPoint p1, CGPoint* p2, const char *r0, const char *r1, const char *r2, const char *r3, const char *r4)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[3] = { r0, r1, r2 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r3, r4, 3, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;
	arg_ptrs [2] = p2;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_62 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIScrollView * p0, UIView * p1, CGFloat p2, const char *r0, const char *r1, const char *r2, const char *r3, const char *r4)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[3] = { r0, r1, r2 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r3, r4, 3, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, mono_class_from_mono_type (paramtype1), managed_method);
	}
	arg_ptrs [1] = mobj1;
	arg_ptrs [2] = &p2;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_63 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIScrollView * p0, UIView * p1, const char *r0, const char *r1, const char *r2, const char *r3)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[2] = { r0, r1 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r2, r3, 2, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, mono_class_from_mono_type (paramtype1), managed_method);
	}
	arg_ptrs [1] = mobj1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_64 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UITabBarController * p0, NSArray * p1, BOOL p2, const char *r0, const char *r1, const char *r2, const char *r3, const char *r4)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[3] = { r0, r1, r2 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r3, r4, 3, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	if (p1) {
		NSArray *arr = (NSArray *) p1;
		xamarin_check_objc_type (p1, [NSArray class], _cmd, self, 1, managed_method);
		MonoClass *e_class;
		MonoArray *marr;
		MonoType *p;
		int j;
		p = xamarin_get_parameter_type (managed_method, 1);
		e_class = mono_class_get_element_class (mono_class_from_mono_type (p));
		marr = mono_array_new (mono_domain_get (), e_class, [arr count]);
		for (j = 0; j < [arr count]; j++) {
			NSObject *nobj = [arr objectAtIndex: j];
			MonoObject *mobj1 = NULL;
			if (nobj) {
				mobj1 = xamarin_get_managed_object_for_ptr_fast (nobj, &exception_gchandle);
				if (exception_gchandle != 0) goto exception_handling;
				xamarin_verify_parameter (mobj1, _cmd, self, nobj, 1, e_class, managed_method);
			}
			mono_array_set (marr, MonoObject *, j, mobj1);
		}
		arg_ptrs [1] = marr;
	} else {
		arg_ptrs [1] = NULL;
	}
	arg_ptrs [2] = &p2;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static id native_to_managed_trampoline_65 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UITabBarController * p0, UIViewController * p1, UIViewController * p2, const char *r0, const char *r1, const char *r2, const char *r3, const char *r4)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[3] = { r0, r1, r2 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r3, r4, 3, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, mono_class_from_mono_type (paramtype1), managed_method);
	}
	arg_ptrs [1] = mobj1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj2, _cmd, self, nsobj2, 2, mono_class_from_mono_type (paramtype2), managed_method);
	}
	arg_ptrs [2] = mobj2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_handle_for_inativeobject ((MonoObject *) retval, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_framework_peer_lock ();
		[retobj retain];
		xamarin_framework_peer_unlock ();
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static id native_to_managed_trampoline_66 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UITabBarController * p0, id p1, const char *r0, const char *r1, const char *r2, const char *r3)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[2] = { r0, r1 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r2, r3, 2, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = xamarin_get_inative_object_static (p1, false, "UIKit.UIViewControllerAnimatedTransitioningWrapper, Xamarin.iOS", "UIKit.IUIViewControllerAnimatedTransitioning, Xamarin.iOS", &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_handle_for_inativeobject ((MonoObject *) retval, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_framework_peer_lock ();
		[retobj retain];
		xamarin_framework_peer_unlock ();
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static NSInteger native_to_managed_trampoline_67 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UITabBarController * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	NSInteger res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(NSInteger *) mono_object_unbox ((MonoObject *) retval);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_68 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UITabBarController * p0, NSArray * p1, const char *r0, const char *r1, const char *r2, const char *r3)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[2] = { r0, r1 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r2, r3, 2, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	if (p1) {
		NSArray *arr = (NSArray *) p1;
		xamarin_check_objc_type (p1, [NSArray class], _cmd, self, 1, managed_method);
		MonoClass *e_class;
		MonoArray *marr;
		MonoType *p;
		int j;
		p = xamarin_get_parameter_type (managed_method, 1);
		e_class = mono_class_get_element_class (mono_class_from_mono_type (p));
		marr = mono_array_new (mono_domain_get (), e_class, [arr count]);
		for (j = 0; j < [arr count]; j++) {
			NSObject *nobj = [arr objectAtIndex: j];
			MonoObject *mobj1 = NULL;
			if (nobj) {
				mobj1 = xamarin_get_managed_object_for_ptr_fast (nobj, &exception_gchandle);
				if (exception_gchandle != 0) goto exception_handling;
				xamarin_verify_parameter (mobj1, _cmd, self, nobj, 1, e_class, managed_method);
			}
			mono_array_set (marr, MonoObject *, j, mobj1);
		}
		arg_ptrs [1] = marr;
	} else {
		arg_ptrs [1] = NULL;
	}

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static BOOL native_to_managed_trampoline_69 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UITabBarController * p0, UIViewController * p1, const char *r0, const char *r1, const char *r2, const char *r3)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[2] = { r0, r1 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r2, r3, 2, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, mono_class_from_mono_type (paramtype1), managed_method);
	}
	arg_ptrs [1] = mobj1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static NSUInteger native_to_managed_trampoline_70 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UITabBarController * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	NSUInteger res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(NSUInteger *) mono_object_unbox ((MonoObject *) retval);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_71 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UITabBarController * p0, UIViewController * p1, const char *r0, const char *r1, const char *r2, const char *r3)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[2] = { r0, r1 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r2, r3, 2, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, mono_class_from_mono_type (paramtype1), managed_method);
	}
	arg_ptrs [1] = mobj1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static BOOL native_to_managed_trampoline_72 (id self, SEL _cmd, MonoMethod **managed_method_ptr, SEL p0, const char *r0, const char *r1, const char *r2)
{
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	arg_ptrs [0] = p0 ? xamarin_get_selector (p0, &exception_gchandle) : NULL;
	if (exception_gchandle != 0) goto exception_handling;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static void native_to_managed_trampoline_73 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIWebView * p0, NSError * p1, const char *r0, const char *r1, const char *r2, const char *r3)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[2] = { r0, r1 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r2, r3, 2, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, mono_class_from_mono_type (paramtype1), managed_method);
	}
	arg_ptrs [1] = mobj1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static void native_to_managed_trampoline_74 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIWebView * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	guint32 exception_gchandle = 0;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return;
}


static BOOL native_to_managed_trampoline_75 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UIWebView * p0, NSURLRequest * p1, NSInteger p2, const char *r0, const char *r1, const char *r2, const char *r3, const char *r4)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	long long nativeEnum2 = p2;
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[3] = { r0, r1, r2 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r3, r4, 3, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, mono_class_from_mono_type (paramtype1), managed_method);
	}
	arg_ptrs [1] = mobj1;
	arg_ptrs [2] = &nativeEnum2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}


static NSInteger native_to_managed_trampoline_76 (id self, SEL _cmd, MonoMethod **managed_method_ptr, UITableView * p0, const char *r0, const char *r1, const char *r2)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoObject *retval = NULL;
	guint32 exception_gchandle = 0;
	NSInteger res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MONO_ASSERT_GC_SAFE;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
	}
	if (!managed_method) {
		const char *paramptr[1] = { r0 };
		managed_method = xamarin_get_reflection_method_method (xamarin_get_method_direct(r1, r2, 1, paramptr, &exception_gchandle));
		if (exception_gchandle != 0) goto exception_handling;
		*managed_method_ptr = managed_method;
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != 0) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != 0) goto exception_handling;
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, mono_class_from_mono_type (paramtype0), managed_method);
	}
	arg_ptrs [0] = mobj0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, NULL);

	res = *(NSInteger *) mono_object_unbox ((MonoObject *) retval);

exception_handling:;
	MONO_THREAD_DETACH;
	if (exception_gchandle != 0)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	return res;
}



@protocol CALayerDelegate
@end

@protocol UICollectionViewSource<UICollectionViewDataSource, UICollectionViewDelegate>
@end

@interface Foundation_InternalNSNotificationHandler : NSObject {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) post:(NSNotification *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation Foundation_InternalNSNotificationHandler { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) post:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_1 (self, _cmd, &managed_method, p0, "Foundation.NSNotification, Xamarin.iOS", "Foundation.InternalNSNotificationHandler, Xamarin.iOS", "Post");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface UIKit_UIControlEventProxy : NSObject {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) BridgeSelector;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation UIKit_UIControlEventProxy { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) BridgeSelector
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "UIKit.UIControlEventProxy, Xamarin.iOS", "Activated");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface __MonoMac_NSActionDispatcher : NSObject {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) xamarinApplySelector;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation __MonoMac_NSActionDispatcher { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) xamarinApplySelector
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "Foundation.NSActionDispatcher, Xamarin.iOS", "Apply");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface __MonoMac_NSAsyncActionDispatcher : NSObject {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) xamarinApplySelector;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation __MonoMac_NSAsyncActionDispatcher { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) xamarinApplySelector
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "Foundation.NSAsyncActionDispatcher, Xamarin.iOS", "Apply");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface AppDelegate : NSObject<UIApplicationDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIWindow *) window;
	-(void) setWindow:(UIWindow *)p0;
	-(BOOL) application:(UIApplication *)p0 didFinishLaunchingWithOptions:(NSDictionary *)p1;
	-(void) applicationWillResignActive:(UIApplication *)p0;
	-(void) applicationDidEnterBackground:(UIApplication *)p0;
	-(void) applicationWillEnterForeground:(UIApplication *)p0;
	-(void) applicationDidBecomeActive:(UIApplication *)p0;
	-(void) applicationWillTerminate:(UIApplication *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end
@implementation AppDelegate { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UIWindow *) window
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_4 (self, _cmd, &managed_method, "JD.iPhone.AppDelegate, JD.iPhone", "get_Window");
	}

	-(void) setWindow:(UIWindow *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, p0, "UIKit.UIWindow, Xamarin.iOS", "JD.iPhone.AppDelegate, JD.iPhone", "set_Window");
	}

	-(BOOL) application:(UIApplication *)p0 didFinishLaunchingWithOptions:(NSDictionary *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, p0, p1, "UIKit.UIApplication, Xamarin.iOS", "Foundation.NSDictionary, Xamarin.iOS", "JD.iPhone.AppDelegate, JD.iPhone", "FinishedLaunching");
	}

	-(void) applicationWillResignActive:(UIApplication *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, "UIKit.UIApplication, Xamarin.iOS", "JD.iPhone.AppDelegate, JD.iPhone", "OnResignActivation");
	}

	-(void) applicationDidEnterBackground:(UIApplication *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, "UIKit.UIApplication, Xamarin.iOS", "JD.iPhone.AppDelegate, JD.iPhone", "DidEnterBackground");
	}

	-(void) applicationWillEnterForeground:(UIApplication *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, "UIKit.UIApplication, Xamarin.iOS", "JD.iPhone.AppDelegate, JD.iPhone", "WillEnterForeground");
	}

	-(void) applicationDidBecomeActive:(UIApplication *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, "UIKit.UIApplication, Xamarin.iOS", "JD.iPhone.AppDelegate, JD.iPhone", "OnActivated");
	}

	-(void) applicationWillTerminate:(UIApplication *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, "UIKit.UIApplication, Xamarin.iOS", "JD.iPhone.AppDelegate, JD.iPhone", "WillTerminate");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_8 (self, _cmd, &managed_method, "JD.iPhone.AppDelegate, JD.iPhone", ".ctor", &call_super);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface BaseVC : UIViewController {
	XamarinObject __monoObjectGCHandle;
}
	@property (nonatomic, assign) UIView * navBarView;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIView *) navBarView;
	-(void) setNavBarView:(UIView *)p0;
	-(void) viewDidLoad;
	-(void) didReceiveMemoryWarning;
	-(BOOL) shouldAutorotate;
	-(NSUInteger) supportedInterfaceOrientations;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation BaseVC { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UIView *) navBarView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.BaseVC, JD.iPhone", "get_navBarView");
	}

	-(void) setNavBarView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.BaseVC, JD.iPhone", "set_navBarView");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.BaseVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) didReceiveMemoryWarning
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.BaseVC, JD.iPhone", "DidReceiveMemoryWarning");
	}

	-(BOOL) shouldAutorotate
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_11 (self, _cmd, &managed_method, "JD.iPhone.BaseVC, JD.iPhone", "ShouldAutorotate");
	}

	-(NSUInteger) supportedInterfaceOrientations
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_12 (self, _cmd, &managed_method, "JD.iPhone.BaseVC, JD.iPhone", "GetSupportedInterfaceOrientations");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface HomeVC : BaseVC {
}
	@property (nonatomic, assign) UIView * actionMenu;
	@property (nonatomic, assign) UIView * actionView;
	@property (nonatomic, assign) UILabel * alertCount;
	@property (nonatomic, assign) UIButton * bellButton;
	@property (nonatomic, assign) UIButton * btnActionMenuClose;
	@property (nonatomic, assign) UIButton * btnAlphabeticalOrder;
	@property (nonatomic, assign) UIButton * btnDelete;
	@property (nonatomic, assign) UIButton * btnDeleteCancel;
	@property (nonatomic, assign) UIButton * btnDeleteYes;
	@property (nonatomic, assign) UIButton * btnDocumentCount;
	@property (nonatomic, assign) UIButton * btnRecentlyModified;
	@property (nonatomic, assign) UIButton * btnRename;
	@property (nonatomic, assign) UIButton * btnRenameNo;
	@property (nonatomic, assign) UIButton * btnRenameYes;
	@property (nonatomic, assign) UIButton * btnShare;
	@property (nonatomic, assign) UIButton * btnSheetClose;
	@property (nonatomic, assign) UIButton * btnSort;
	@property (nonatomic, assign) UIView * deleteView;
	@property (nonatomic, assign) UIView * gradientView;
	@property (nonatomic, assign) UIView * maskView;
	@property (nonatomic, assign) UILabel * navTitle;
	@property (nonatomic, assign) UIView * navView;
	@property (nonatomic, assign) UIView * profileView;
	@property (nonatomic, assign) UIView * renameView;
	@property (nonatomic, assign) UIButton * searchButton;
	@property (nonatomic, assign) UIView * sortMenu;
	@property (nonatomic, assign) UITableView * table;
	@property (nonatomic, assign) UITextField * txtRename;
	-(UIView *) actionMenu;
	-(void) setActionMenu:(UIView *)p0;
	-(UIView *) actionView;
	-(void) setActionView:(UIView *)p0;
	-(UILabel *) alertCount;
	-(void) setAlertCount:(UILabel *)p0;
	-(UIButton *) bellButton;
	-(void) setBellButton:(UIButton *)p0;
	-(UIButton *) btnActionMenuClose;
	-(void) setBtnActionMenuClose:(UIButton *)p0;
	-(UIButton *) btnAlphabeticalOrder;
	-(void) setBtnAlphabeticalOrder:(UIButton *)p0;
	-(UIButton *) btnDelete;
	-(void) setBtnDelete:(UIButton *)p0;
	-(UIButton *) btnDeleteCancel;
	-(void) setBtnDeleteCancel:(UIButton *)p0;
	-(UIButton *) btnDeleteYes;
	-(void) setBtnDeleteYes:(UIButton *)p0;
	-(UIButton *) btnDocumentCount;
	-(void) setBtnDocumentCount:(UIButton *)p0;
	-(UIButton *) btnRecentlyModified;
	-(void) setBtnRecentlyModified:(UIButton *)p0;
	-(UIButton *) btnRename;
	-(void) setBtnRename:(UIButton *)p0;
	-(UIButton *) btnRenameNo;
	-(void) setBtnRenameNo:(UIButton *)p0;
	-(UIButton *) btnRenameYes;
	-(void) setBtnRenameYes:(UIButton *)p0;
	-(UIButton *) btnShare;
	-(void) setBtnShare:(UIButton *)p0;
	-(UIButton *) btnSheetClose;
	-(void) setBtnSheetClose:(UIButton *)p0;
	-(UIButton *) btnSort;
	-(void) setBtnSort:(UIButton *)p0;
	-(UIView *) deleteView;
	-(void) setDeleteView:(UIView *)p0;
	-(UIView *) gradientView;
	-(void) setGradientView:(UIView *)p0;
	-(UIView *) maskView;
	-(void) setMaskView:(UIView *)p0;
	-(UILabel *) navTitle;
	-(void) setNavTitle:(UILabel *)p0;
	-(UIView *) navView;
	-(void) setNavView:(UIView *)p0;
	-(UIView *) profileView;
	-(void) setProfileView:(UIView *)p0;
	-(UIView *) renameView;
	-(void) setRenameView:(UIView *)p0;
	-(UIButton *) searchButton;
	-(void) setSearchButton:(UIButton *)p0;
	-(UIView *) sortMenu;
	-(void) setSortMenu:(UIView *)p0;
	-(UITableView *) table;
	-(void) setTable:(UITableView *)p0;
	-(UITextField *) txtRename;
	-(void) setTxtRename:(UITextField *)p0;
	-(void) viewDidLoad;
	-(void) viewDidLayoutSubviews;
	-(void) didReceiveMemoryWarning;
	-(void) BellButton_TouchUpInside:(UIButton *)p0;
	-(void) SearchButton_TouchUpInside:(UIButton *)p0;
	-(void) BtnSort_TouchUpInside:(UIButton *)p0;
	-(void) BtnSheetClose_TouchUpInside:(UIButton *)p0;
	-(void) BtnRecentlyModified_TouchUpInside:(UIButton *)p0;
	-(void) BtnDocumentCount_TouchUpInside:(UIButton *)p0;
	-(void) BtnAlphabeticalOrder_TouchUpInside:(UIButton *)p0;
	-(void) BtnActionMenuClose_TouchUpInside:(UIButton *)p0;
	-(void) BtnRename_TouchUpInside:(UIButton *)p0;
	-(void) btnShareTapped:(UIButton *)p0;
	-(void) btnDeleteTapped:(UIButton *)p0;
	-(void) BtnRenameYes_TouchUpInside:(UIButton *)p0;
	-(void) BtnRenameNo_TouchUpInside:(UIButton *)p0;
	-(void) BtnDeleteYes_TouchUpInside:(UIButton *)p0;
	-(void) BtnDeleteCancel_TouchUpInside:(UIButton *)p0;
@end
@implementation HomeVC { } 

	-(UIView *) actionMenu
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_actionMenu");
	}

	-(void) setActionMenu:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_actionMenu");
	}

	-(UIView *) actionView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_actionView");
	}

	-(void) setActionView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_actionView");
	}

	-(UILabel *) alertCount
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_alertCount");
	}

	-(void) setAlertCount:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_alertCount");
	}

	-(UIButton *) bellButton
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_bellButton");
	}

	-(void) setBellButton:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_bellButton");
	}

	-(UIButton *) btnActionMenuClose
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_btnActionMenuClose");
	}

	-(void) setBtnActionMenuClose:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_btnActionMenuClose");
	}

	-(UIButton *) btnAlphabeticalOrder
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_btnAlphabeticalOrder");
	}

	-(void) setBtnAlphabeticalOrder:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_btnAlphabeticalOrder");
	}

	-(UIButton *) btnDelete
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_btnDelete");
	}

	-(void) setBtnDelete:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_btnDelete");
	}

	-(UIButton *) btnDeleteCancel
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_btnDeleteCancel");
	}

	-(void) setBtnDeleteCancel:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_btnDeleteCancel");
	}

	-(UIButton *) btnDeleteYes
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_btnDeleteYes");
	}

	-(void) setBtnDeleteYes:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_btnDeleteYes");
	}

	-(UIButton *) btnDocumentCount
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_btnDocumentCount");
	}

	-(void) setBtnDocumentCount:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_btnDocumentCount");
	}

	-(UIButton *) btnRecentlyModified
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_btnRecentlyModified");
	}

	-(void) setBtnRecentlyModified:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_btnRecentlyModified");
	}

	-(UIButton *) btnRename
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_btnRename");
	}

	-(void) setBtnRename:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_btnRename");
	}

	-(UIButton *) btnRenameNo
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_btnRenameNo");
	}

	-(void) setBtnRenameNo:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_btnRenameNo");
	}

	-(UIButton *) btnRenameYes
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_btnRenameYes");
	}

	-(void) setBtnRenameYes:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_btnRenameYes");
	}

	-(UIButton *) btnShare
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_btnShare");
	}

	-(void) setBtnShare:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_btnShare");
	}

	-(UIButton *) btnSheetClose
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_btnSheetClose");
	}

	-(void) setBtnSheetClose:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_btnSheetClose");
	}

	-(UIButton *) btnSort
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_btnSort");
	}

	-(void) setBtnSort:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_btnSort");
	}

	-(UIView *) deleteView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_deleteView");
	}

	-(void) setDeleteView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_deleteView");
	}

	-(UIView *) gradientView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_gradientView");
	}

	-(void) setGradientView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_gradientView");
	}

	-(UIView *) maskView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_maskView");
	}

	-(void) setMaskView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_maskView");
	}

	-(UILabel *) navTitle
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_navTitle");
	}

	-(void) setNavTitle:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_navTitle");
	}

	-(UIView *) navView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_navView");
	}

	-(void) setNavView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_navView");
	}

	-(UIView *) profileView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_profileView");
	}

	-(void) setProfileView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_profileView");
	}

	-(UIView *) renameView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_renameView");
	}

	-(void) setRenameView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_renameView");
	}

	-(UIButton *) searchButton
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_searchButton");
	}

	-(void) setSearchButton:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_searchButton");
	}

	-(UIView *) sortMenu
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_sortMenu");
	}

	-(void) setSortMenu:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_sortMenu");
	}

	-(UITableView *) table
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_17 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_table");
	}

	-(void) setTable:(UITableView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_18 (self, _cmd, &managed_method, p0, "UIKit.UITableView, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_table");
	}

	-(UITextField *) txtRename
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_19 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "get_txtRename");
	}

	-(void) setTxtRename:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_20 (self, _cmd, &managed_method, p0, "UIKit.UITextField, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "set_txtRename");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) viewDidLayoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "ViewDidLayoutSubviews");
	}

	-(void) didReceiveMemoryWarning
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.HomeVC, JD.iPhone", "DidReceiveMemoryWarning");
	}

	-(void) BellButton_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "BellButton_TouchUpInside");
	}

	-(void) SearchButton_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "SearchButton_TouchUpInside");
	}

	-(void) BtnSort_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "BtnSort_TouchUpInside");
	}

	-(void) BtnSheetClose_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "BtnSheetClose_TouchUpInside");
	}

	-(void) BtnRecentlyModified_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "BtnRecentlyModified_TouchUpInside");
	}

	-(void) BtnDocumentCount_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "BtnDocumentCount_TouchUpInside");
	}

	-(void) BtnAlphabeticalOrder_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "BtnAlphabeticalOrder_TouchUpInside");
	}

	-(void) BtnActionMenuClose_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "BtnActionMenuClose_TouchUpInside");
	}

	-(void) BtnRename_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "BtnRename_TouchUpInside");
	}

	-(void) btnShareTapped:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "btnShareTapped");
	}

	-(void) btnDeleteTapped:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "btnDeleteTapped");
	}

	-(void) BtnRenameYes_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "BtnRenameYes_TouchUpInside");
	}

	-(void) BtnRenameNo_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "BtnRenameNo_TouchUpInside");
	}

	-(void) BtnDeleteYes_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "BtnDeleteYes_TouchUpInside");
	}

	-(void) BtnDeleteCancel_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.HomeVC, JD.iPhone", "BtnDeleteCancel_TouchUpInside");
	}
@end

@interface GradientView : UIView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) drawRect:(CGRect)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end
@implementation GradientView { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) drawRect:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_21 (self, _cmd, &managed_method, p0, "CoreGraphics.CGRect, Xamarin.iOS", "Xamarin.GradientView, JD.iPhone", "Draw");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_8 (self, _cmd, &managed_method, "Xamarin.GradientView, JD.iPhone", ".ctor", &call_super);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UIView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface JD_iPhone_ExportTableSource : NSObject<UIScrollViewDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation JD_iPhone_ExportTableSource { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_22 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.ExportTableSource, JD.iPhone", "GetCell");
	}

	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "System.nint, Xamarin.iOS", "JD.iPhone.ExportTableSource, JD.iPhone", "RowsInSection");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface ExportVC : BaseVC {
}
	@property (nonatomic, assign) UIButton * btnCancel;
	@property (nonatomic, assign) UIView * navBarView;
	@property (nonatomic, assign) UITableView * table;
	-(UIButton *) btnCancel;
	-(void) setBtnCancel:(UIButton *)p0;
	-(UIView *) navBarView;
	-(void) setNavBarView:(UIView *)p0;
	-(UITableView *) table;
	-(void) setTable:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidLayoutSubviews;
	-(void) didReceiveMemoryWarning;
	-(void) BtnCancel_TouchUpInside:(UIButton *)p0;
@end
@implementation ExportVC { } 

	-(UIButton *) btnCancel
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.ExportVC, JD.iPhone", "get_btnCancel");
	}

	-(void) setBtnCancel:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.ExportVC, JD.iPhone", "set_btnCancel");
	}

	-(UIView *) navBarView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.ExportVC, JD.iPhone", "get_navBarView");
	}

	-(void) setNavBarView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.ExportVC, JD.iPhone", "set_navBarView");
	}

	-(UITableView *) table
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_17 (self, _cmd, &managed_method, "JD.iPhone.ExportVC, JD.iPhone", "get_table");
	}

	-(void) setTable:(UITableView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_18 (self, _cmd, &managed_method, p0, "UIKit.UITableView, Xamarin.iOS", "JD.iPhone.ExportVC, JD.iPhone", "set_table");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.ExportVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) viewDidLayoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.ExportVC, JD.iPhone", "ViewDidLayoutSubviews");
	}

	-(void) didReceiveMemoryWarning
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.ExportVC, JD.iPhone", "DidReceiveMemoryWarning");
	}

	-(void) BtnCancel_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.ExportVC, JD.iPhone", "BtnCancel_TouchUpInside");
	}
@end

@interface BaseCell : UITableViewCell {
	XamarinObject __monoObjectGCHandle;
}
	@property (nonatomic, assign) UIView * mainView;
	@property (nonatomic, assign) UILabel * message;
	@property (nonatomic, assign) UIImageView * openStatus;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIView *) mainView;
	-(void) setMainView:(UIView *)p0;
	-(UILabel *) message;
	-(void) setMessage:(UILabel *)p0;
	-(UIImageView *) openStatus;
	-(void) setOpenStatus:(UIImageView *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation BaseCell { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UIView *) mainView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.BaseCell, JD.iPhone", "get_mainView");
	}

	-(void) setMainView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.BaseCell, JD.iPhone", "set_mainView");
	}

	-(UILabel *) message
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.BaseCell, JD.iPhone", "get_message");
	}

	-(void) setMessage:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.BaseCell, JD.iPhone", "set_message");
	}

	-(UIImageView *) openStatus
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_24 (self, _cmd, &managed_method, "JD.iPhone.BaseCell, JD.iPhone", "get_openStatus");
	}

	-(void) setOpenStatus:(UIImageView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_25 (self, _cmd, &managed_method, p0, "UIKit.UIImageView, Xamarin.iOS", "JD.iPhone.BaseCell, JD.iPhone", "set_openStatus");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface CategoryCell : BaseCell {
}
	@property (nonatomic, assign) UIButton * btnOptions;
	@property (nonatomic, assign) UILabel * categoryName;
	@property (nonatomic, assign) UILabel * itemCount;
	@property (nonatomic, assign) UIScrollView * scrollView;
	-(UIButton *) btnOptions;
	-(void) setBtnOptions:(UIButton *)p0;
	-(UILabel *) categoryName;
	-(void) setCategoryName:(UILabel *)p0;
	-(UILabel *) itemCount;
	-(void) setItemCount:(UILabel *)p0;
	-(UIScrollView *) scrollView;
	-(void) setScrollView:(UIScrollView *)p0;
@end
@implementation CategoryCell { } 

	-(UIButton *) btnOptions
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CategoryCell, JD.iPhone", "get_btnOptions");
	}

	-(void) setBtnOptions:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryCell, JD.iPhone", "set_btnOptions");
	}

	-(UILabel *) categoryName
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.CategoryCell, JD.iPhone", "get_categoryName");
	}

	-(void) setCategoryName:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.CategoryCell, JD.iPhone", "set_categoryName");
	}

	-(UILabel *) itemCount
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.CategoryCell, JD.iPhone", "get_itemCount");
	}

	-(void) setItemCount:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.CategoryCell, JD.iPhone", "set_itemCount");
	}

	-(UIScrollView *) scrollView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_26 (self, _cmd, &managed_method, "JD.iPhone.CategoryCell, JD.iPhone", "get_scrollView");
	}

	-(void) setScrollView:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_27 (self, _cmd, &managed_method, p0, "UIKit.UIScrollView, Xamarin.iOS", "JD.iPhone.CategoryCell, JD.iPhone", "set_scrollView");
	}
@end

@interface ExportCell : BaseCell {
}
	@property (nonatomic, assign) UIButton * btnSelect;
	@property (nonatomic, assign) UILabel * categoryName;
	@property (nonatomic, assign) UIImageView * fileImage;
	@property (nonatomic, assign) UILabel * fileName;
	@property (nonatomic, assign) UILabel * issuedDate;
	@property (nonatomic, assign) UILabel * itemCount;
	@property (nonatomic, assign) UIImageView * openStatus;
	-(UIButton *) btnSelect;
	-(void) setBtnSelect:(UIButton *)p0;
	-(UILabel *) categoryName;
	-(void) setCategoryName:(UILabel *)p0;
	-(UIImageView *) fileImage;
	-(void) setFileImage:(UIImageView *)p0;
	-(UILabel *) fileName;
	-(void) setFileName:(UILabel *)p0;
	-(UILabel *) issuedDate;
	-(void) setIssuedDate:(UILabel *)p0;
	-(UILabel *) itemCount;
	-(void) setItemCount:(UILabel *)p0;
	-(UIImageView *) openStatus;
	-(void) setOpenStatus:(UIImageView *)p0;
@end
@implementation ExportCell { } 

	-(UIButton *) btnSelect
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.ExportCell, JD.iPhone", "get_btnSelect");
	}

	-(void) setBtnSelect:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.ExportCell, JD.iPhone", "set_btnSelect");
	}

	-(UILabel *) categoryName
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.ExportCell, JD.iPhone", "get_categoryName");
	}

	-(void) setCategoryName:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.ExportCell, JD.iPhone", "set_categoryName");
	}

	-(UIImageView *) fileImage
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_24 (self, _cmd, &managed_method, "JD.iPhone.ExportCell, JD.iPhone", "get_fileImage");
	}

	-(void) setFileImage:(UIImageView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_25 (self, _cmd, &managed_method, p0, "UIKit.UIImageView, Xamarin.iOS", "JD.iPhone.ExportCell, JD.iPhone", "set_fileImage");
	}

	-(UILabel *) fileName
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.ExportCell, JD.iPhone", "get_fileName");
	}

	-(void) setFileName:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.ExportCell, JD.iPhone", "set_fileName");
	}

	-(UILabel *) issuedDate
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.ExportCell, JD.iPhone", "get_issuedDate");
	}

	-(void) setIssuedDate:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.ExportCell, JD.iPhone", "set_issuedDate");
	}

	-(UILabel *) itemCount
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.ExportCell, JD.iPhone", "get_itemCount");
	}

	-(void) setItemCount:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.ExportCell, JD.iPhone", "set_itemCount");
	}

	-(UIImageView *) openStatus
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_24 (self, _cmd, &managed_method, "JD.iPhone.ExportCell, JD.iPhone", "get_openStatus");
	}

	-(void) setOpenStatus:(UIImageView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_25 (self, _cmd, &managed_method, p0, "UIKit.UIImageView, Xamarin.iOS", "JD.iPhone.ExportCell, JD.iPhone", "set_openStatus");
	}
@end

@interface JD_iPhone_ResourceTableSource : NSObject<UIScrollViewDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end
@implementation JD_iPhone_ResourceTableSource { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_22 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.ResourceTableSource, JD.iPhone", "GetCell");
	}

	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "System.nint, Xamarin.iOS", "JD.iPhone.ResourceTableSource, JD.iPhone", "RowsInSection");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_8 (self, _cmd, &managed_method, "JD.iPhone.ResourceTableSource, JD.iPhone", ".ctor", &call_super);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface ResourcesVC : BaseVC {
}
	@property (nonatomic, assign) UITableView * table;
	@property (nonatomic, assign) UIView * navBarView;
	-(UITableView *) table;
	-(void) setTable:(UITableView *)p0;
	-(UIView *) navBarView;
	-(void) setNavBarView:(UIView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidLayoutSubviews;
	-(void) didReceiveMemoryWarning;
@end
@implementation ResourcesVC { } 

	-(UITableView *) table
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_17 (self, _cmd, &managed_method, "JD.iPhone.ResourcesVC, JD.iPhone", "get_table");
	}

	-(void) setTable:(UITableView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_18 (self, _cmd, &managed_method, p0, "UIKit.UITableView, Xamarin.iOS", "JD.iPhone.ResourcesVC, JD.iPhone", "set_table");
	}

	-(UIView *) navBarView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.ResourcesVC, JD.iPhone", "get_navBarView");
	}

	-(void) setNavBarView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.ResourcesVC, JD.iPhone", "set_navBarView");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.ResourcesVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) viewDidLayoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.ResourcesVC, JD.iPhone", "ViewDidLayoutSubviews");
	}

	-(void) didReceiveMemoryWarning
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.ResourcesVC, JD.iPhone", "DidReceiveMemoryWarning");
	}
@end

@interface JD_iPhone_AlertTableSource : NSObject<UIScrollViewDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation JD_iPhone_AlertTableSource { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_22 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.AlertTableSource, JD.iPhone", "GetCell");
	}

	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "System.nint, Xamarin.iOS", "JD.iPhone.AlertTableSource, JD.iPhone", "RowsInSection");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface AlertVC : BaseVC {
}
	@property (nonatomic, assign) UIView * navBarView;
	@property (nonatomic, assign) UITableView * table;
	-(UIView *) navBarView;
	-(void) setNavBarView:(UIView *)p0;
	-(UITableView *) table;
	-(void) setTable:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidLayoutSubviews;
	-(void) didReceiveMemoryWarning;
	-(void) UIButtonA0vvadsO_TouchUpInside:(UIButton *)p0;
@end
@implementation AlertVC { } 

	-(UIView *) navBarView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.AlertVC, JD.iPhone", "get_navBarView");
	}

	-(void) setNavBarView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.AlertVC, JD.iPhone", "set_navBarView");
	}

	-(UITableView *) table
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_17 (self, _cmd, &managed_method, "JD.iPhone.AlertVC, JD.iPhone", "get_table");
	}

	-(void) setTable:(UITableView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_18 (self, _cmd, &managed_method, p0, "UIKit.UITableView, Xamarin.iOS", "JD.iPhone.AlertVC, JD.iPhone", "set_table");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.AlertVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) viewDidLayoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.AlertVC, JD.iPhone", "ViewDidLayoutSubviews");
	}

	-(void) didReceiveMemoryWarning
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.AlertVC, JD.iPhone", "DidReceiveMemoryWarning");
	}

	-(void) UIButtonA0vvadsO_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.AlertVC, JD.iPhone", "UIButtonA0vvadsO_TouchUpInside");
	}
@end

@interface AlertCell : UITableViewCell {
	XamarinObject __monoObjectGCHandle;
}
	@property (nonatomic, assign) UIImageView * alertImage;
	@property (nonatomic, assign) UILabel * message;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIImageView *) alertImage;
	-(void) setAlertImage:(UIImageView *)p0;
	-(UILabel *) message;
	-(void) setMessage:(UILabel *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation AlertCell { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UIImageView *) alertImage
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_24 (self, _cmd, &managed_method, "JD.iPhone.AlertCell, JD.iPhone", "get_alertImage");
	}

	-(void) setAlertImage:(UIImageView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_25 (self, _cmd, &managed_method, p0, "UIKit.UIImageView, Xamarin.iOS", "JD.iPhone.AlertCell, JD.iPhone", "set_alertImage");
	}

	-(UILabel *) message
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.AlertCell, JD.iPhone", "get_message");
	}

	-(void) setMessage:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.AlertCell, JD.iPhone", "set_message");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface JD_iPhone_SettingsTableSource : NSObject<UIScrollViewDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation JD_iPhone_SettingsTableSource { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_22 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.SettingsTableSource, JD.iPhone", "GetCell");
	}

	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "System.nint, Xamarin.iOS", "JD.iPhone.SettingsTableSource, JD.iPhone", "RowsInSection");
	}

	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_28 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.SettingsTableSource, JD.iPhone", "RowSelected");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface SettingsVC : BaseVC {
}
	@property (nonatomic, assign) UIButton * btnLogout;
	@property (nonatomic, assign) UIView * navBarView;
	@property (nonatomic, assign) UITableView * table;
	-(UIButton *) btnLogout;
	-(void) setBtnLogout:(UIButton *)p0;
	-(UIView *) navBarView;
	-(void) setNavBarView:(UIView *)p0;
	-(UITableView *) table;
	-(void) setTable:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) didReceiveMemoryWarning;
	-(void) viewDidLayoutSubviews;
	-(void) BtnLogout_TouchUpInside:(UIButton *)p0;
@end
@implementation SettingsVC { } 

	-(UIButton *) btnLogout
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.SettingsVC, JD.iPhone", "get_btnLogout");
	}

	-(void) setBtnLogout:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.SettingsVC, JD.iPhone", "set_btnLogout");
	}

	-(UIView *) navBarView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.SettingsVC, JD.iPhone", "get_navBarView");
	}

	-(void) setNavBarView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.SettingsVC, JD.iPhone", "set_navBarView");
	}

	-(UITableView *) table
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_17 (self, _cmd, &managed_method, "JD.iPhone.SettingsVC, JD.iPhone", "get_table");
	}

	-(void) setTable:(UITableView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_18 (self, _cmd, &managed_method, p0, "UIKit.UITableView, Xamarin.iOS", "JD.iPhone.SettingsVC, JD.iPhone", "set_table");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.SettingsVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) didReceiveMemoryWarning
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.SettingsVC, JD.iPhone", "DidReceiveMemoryWarning");
	}

	-(void) viewDidLayoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.SettingsVC, JD.iPhone", "ViewDidLayoutSubviews");
	}

	-(void) BtnLogout_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.SettingsVC, JD.iPhone", "BtnLogout_TouchUpInside");
	}
@end

@interface JD_iPhone_SearchTableSource : NSObject<UIScrollViewDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation JD_iPhone_SearchTableSource { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_22 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.SearchTableSource, JD.iPhone", "GetCell");
	}

	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "System.nint, Xamarin.iOS", "JD.iPhone.SearchTableSource, JD.iPhone", "RowsInSection");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface SearchVC : BaseVC {
}
	@property (nonatomic, assign) UIView * navBarView;
	@property (nonatomic, assign) UISearchBar * searchBar;
	@property (nonatomic, assign) UITableView * table;
	-(UIView *) navBarView;
	-(void) setNavBarView:(UIView *)p0;
	-(UISearchBar *) searchBar;
	-(void) setSearchBar:(UISearchBar *)p0;
	-(UITableView *) table;
	-(void) setTable:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidLayoutSubviews;
	-(void) didReceiveMemoryWarning;
@end
@implementation SearchVC { } 

	-(UIView *) navBarView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.SearchVC, JD.iPhone", "get_navBarView");
	}

	-(void) setNavBarView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.SearchVC, JD.iPhone", "set_navBarView");
	}

	-(UISearchBar *) searchBar
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_29 (self, _cmd, &managed_method, "JD.iPhone.SearchVC, JD.iPhone", "get_searchBar");
	}

	-(void) setSearchBar:(UISearchBar *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_30 (self, _cmd, &managed_method, p0, "UIKit.UISearchBar, Xamarin.iOS", "JD.iPhone.SearchVC, JD.iPhone", "set_searchBar");
	}

	-(UITableView *) table
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_17 (self, _cmd, &managed_method, "JD.iPhone.SearchVC, JD.iPhone", "get_table");
	}

	-(void) setTable:(UITableView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_18 (self, _cmd, &managed_method, p0, "UIKit.UITableView, Xamarin.iOS", "JD.iPhone.SearchVC, JD.iPhone", "set_table");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.SearchVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) viewDidLayoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.SearchVC, JD.iPhone", "ViewDidLayoutSubviews");
	}

	-(void) didReceiveMemoryWarning
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.SearchVC, JD.iPhone", "DidReceiveMemoryWarning");
	}
@end

@interface FileCell : UITableViewCell {
	XamarinObject __monoObjectGCHandle;
}
	@property (nonatomic, assign) UIButton * btnOptions;
	@property (nonatomic, assign) UIButton * btnOptions2;
	@property (nonatomic, assign) UIImageView * fileImage;
	@property (nonatomic, assign) UIImageView * fileImage2;
	@property (nonatomic, assign) UILabel * fileName;
	@property (nonatomic, assign) UILabel * fileName2;
	@property (nonatomic, assign) UILabel * issuedDate;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIButton *) btnOptions;
	-(void) setBtnOptions:(UIButton *)p0;
	-(UIButton *) btnOptions2;
	-(void) setBtnOptions2:(UIButton *)p0;
	-(UIImageView *) fileImage;
	-(void) setFileImage:(UIImageView *)p0;
	-(UIImageView *) fileImage2;
	-(void) setFileImage2:(UIImageView *)p0;
	-(UILabel *) fileName;
	-(void) setFileName:(UILabel *)p0;
	-(UILabel *) fileName2;
	-(void) setFileName2:(UILabel *)p0;
	-(UILabel *) issuedDate;
	-(void) setIssuedDate:(UILabel *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation FileCell { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UIButton *) btnOptions
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.FileCell, JD.iPhone", "get_btnOptions");
	}

	-(void) setBtnOptions:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.FileCell, JD.iPhone", "set_btnOptions");
	}

	-(UIButton *) btnOptions2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.FileCell, JD.iPhone", "get_btnOptions2");
	}

	-(void) setBtnOptions2:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.FileCell, JD.iPhone", "set_btnOptions2");
	}

	-(UIImageView *) fileImage
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_24 (self, _cmd, &managed_method, "JD.iPhone.FileCell, JD.iPhone", "get_fileImage");
	}

	-(void) setFileImage:(UIImageView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_25 (self, _cmd, &managed_method, p0, "UIKit.UIImageView, Xamarin.iOS", "JD.iPhone.FileCell, JD.iPhone", "set_fileImage");
	}

	-(UIImageView *) fileImage2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_24 (self, _cmd, &managed_method, "JD.iPhone.FileCell, JD.iPhone", "get_fileImage2");
	}

	-(void) setFileImage2:(UIImageView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_25 (self, _cmd, &managed_method, p0, "UIKit.UIImageView, Xamarin.iOS", "JD.iPhone.FileCell, JD.iPhone", "set_fileImage2");
	}

	-(UILabel *) fileName
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.FileCell, JD.iPhone", "get_fileName");
	}

	-(void) setFileName:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.FileCell, JD.iPhone", "set_fileName");
	}

	-(UILabel *) fileName2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.FileCell, JD.iPhone", "get_fileName2");
	}

	-(void) setFileName2:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.FileCell, JD.iPhone", "set_fileName2");
	}

	-(UILabel *) issuedDate
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.FileCell, JD.iPhone", "get_issuedDate");
	}

	-(void) setIssuedDate:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.FileCell, JD.iPhone", "set_issuedDate");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface JD_iPhone_CategorySource : NSObject<UIScrollViewDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation JD_iPhone_CategorySource { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_22 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.CategorySource, JD.iPhone", "GetCell");
	}

	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "System.nint, Xamarin.iOS", "JD.iPhone.CategorySource, JD.iPhone", "RowsInSection");
	}

	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_28 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.CategorySource, JD.iPhone", "RowSelected");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface CategoryVC : BaseVC {
}
	@property (nonatomic, assign) UIView * actionMenu;
	@property (nonatomic, assign) UIView * actionView;
	@property (nonatomic, assign) UIButton * btnAction;
	@property (nonatomic, assign) UIButton * btnBack;
	@property (nonatomic, assign) UIButton * btnChangeView;
	@property (nonatomic, assign) UIButton * btnDelete;
	@property (nonatomic, assign) UIButton * btnDeleteCancel;
	@property (nonatomic, assign) UIButton * btnDeleteYes;
	@property (nonatomic, assign) UIButton * btnRename;
	@property (nonatomic, assign) UIButton * btnRenameCancel;
	@property (nonatomic, assign) UIButton * btnRenameYes;
	@property (nonatomic, assign) UIButton * btnShare;
	@property (nonatomic, assign) UIButton * btnSort;
	@property (nonatomic, assign) UIButton * btnSortMenuClose;
	@property (nonatomic, assign) UIView * deleteView;
	@property (nonatomic, assign) UIView * maskView;
	@property (nonatomic, assign) UIView * navBarView;
	@property (nonatomic, assign) UIView * renameView;
	@property (nonatomic, assign) UIView * sortMenu;
	@property (nonatomic, assign) UITableView * table;
	@property (nonatomic, assign) UITextField * txtRename;
	-(UIView *) actionMenu;
	-(void) setActionMenu:(UIView *)p0;
	-(UIView *) actionView;
	-(void) setActionView:(UIView *)p0;
	-(UIButton *) btnAction;
	-(void) setBtnAction:(UIButton *)p0;
	-(UIButton *) btnBack;
	-(void) setBtnBack:(UIButton *)p0;
	-(UIButton *) btnChangeView;
	-(void) setBtnChangeView:(UIButton *)p0;
	-(UIButton *) btnDelete;
	-(void) setBtnDelete:(UIButton *)p0;
	-(UIButton *) btnDeleteCancel;
	-(void) setBtnDeleteCancel:(UIButton *)p0;
	-(UIButton *) btnDeleteYes;
	-(void) setBtnDeleteYes:(UIButton *)p0;
	-(UIButton *) btnRename;
	-(void) setBtnRename:(UIButton *)p0;
	-(UIButton *) btnRenameCancel;
	-(void) setBtnRenameCancel:(UIButton *)p0;
	-(UIButton *) btnRenameYes;
	-(void) setBtnRenameYes:(UIButton *)p0;
	-(UIButton *) btnShare;
	-(void) setBtnShare:(UIButton *)p0;
	-(UIButton *) btnSort;
	-(void) setBtnSort:(UIButton *)p0;
	-(UIButton *) btnSortMenuClose;
	-(void) setBtnSortMenuClose:(UIButton *)p0;
	-(UIView *) deleteView;
	-(void) setDeleteView:(UIView *)p0;
	-(UIView *) maskView;
	-(void) setMaskView:(UIView *)p0;
	-(UIView *) navBarView;
	-(void) setNavBarView:(UIView *)p0;
	-(UIView *) renameView;
	-(void) setRenameView:(UIView *)p0;
	-(UIView *) sortMenu;
	-(void) setSortMenu:(UIView *)p0;
	-(UITableView *) table;
	-(void) setTable:(UITableView *)p0;
	-(UITextField *) txtRename;
	-(void) setTxtRename:(UITextField *)p0;
	-(void) viewDidLoad;
	-(void) viewDidLayoutSubviews;
	-(void) BtnBack_TouchUpInside:(UIButton *)p0;
	-(void) BtnAction_TouchUpInside:(UIButton *)p0;
	-(void) BtnSortOption_TouchUpInside:(UIButton *)p0;
	-(void) SortMenuClose:(UIButton *)p0;
	-(void) actionMenuClose:(UIButton *)p0;
	-(void) viewOptionChange:(UIButton *)p0;
	-(void) BtnRename_TouchUpInside:(UIButton *)p0;
	-(void) BtnShare_TouchUpInside:(UIButton *)p0;
	-(void) BtnDelete_TouchUpInside:(UIButton *)p0;
	-(void) BtnRenameYes_TouchUpInside:(UIButton *)p0;
	-(void) BtnRenameCancel_TouchUpInside:(UIButton *)p0;
	-(void) BtnDeleteYes_TouchUpInside:(UIButton *)p0;
	-(void) BtnDeleteCancel_TouchUpInside:(UIButton *)p0;
@end
@implementation CategoryVC { } 

	-(UIView *) actionMenu
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "get_actionMenu");
	}

	-(void) setActionMenu:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "set_actionMenu");
	}

	-(UIView *) actionView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "get_actionView");
	}

	-(void) setActionView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "set_actionView");
	}

	-(UIButton *) btnAction
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "get_btnAction");
	}

	-(void) setBtnAction:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "set_btnAction");
	}

	-(UIButton *) btnBack
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "get_btnBack");
	}

	-(void) setBtnBack:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "set_btnBack");
	}

	-(UIButton *) btnChangeView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "get_btnChangeView");
	}

	-(void) setBtnChangeView:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "set_btnChangeView");
	}

	-(UIButton *) btnDelete
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "get_btnDelete");
	}

	-(void) setBtnDelete:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "set_btnDelete");
	}

	-(UIButton *) btnDeleteCancel
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "get_btnDeleteCancel");
	}

	-(void) setBtnDeleteCancel:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "set_btnDeleteCancel");
	}

	-(UIButton *) btnDeleteYes
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "get_btnDeleteYes");
	}

	-(void) setBtnDeleteYes:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "set_btnDeleteYes");
	}

	-(UIButton *) btnRename
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "get_btnRename");
	}

	-(void) setBtnRename:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "set_btnRename");
	}

	-(UIButton *) btnRenameCancel
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "get_btnRenameCancel");
	}

	-(void) setBtnRenameCancel:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "set_btnRenameCancel");
	}

	-(UIButton *) btnRenameYes
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "get_btnRenameYes");
	}

	-(void) setBtnRenameYes:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "set_btnRenameYes");
	}

	-(UIButton *) btnShare
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "get_btnShare");
	}

	-(void) setBtnShare:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "set_btnShare");
	}

	-(UIButton *) btnSort
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "get_btnSort");
	}

	-(void) setBtnSort:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "set_btnSort");
	}

	-(UIButton *) btnSortMenuClose
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "get_btnSortMenuClose");
	}

	-(void) setBtnSortMenuClose:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "set_btnSortMenuClose");
	}

	-(UIView *) deleteView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "get_deleteView");
	}

	-(void) setDeleteView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "set_deleteView");
	}

	-(UIView *) maskView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "get_maskView");
	}

	-(void) setMaskView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "set_maskView");
	}

	-(UIView *) navBarView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "get_navBarView");
	}

	-(void) setNavBarView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "set_navBarView");
	}

	-(UIView *) renameView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "get_renameView");
	}

	-(void) setRenameView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "set_renameView");
	}

	-(UIView *) sortMenu
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "get_sortMenu");
	}

	-(void) setSortMenu:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "set_sortMenu");
	}

	-(UITableView *) table
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_17 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "get_table");
	}

	-(void) setTable:(UITableView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_18 (self, _cmd, &managed_method, p0, "UIKit.UITableView, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "set_table");
	}

	-(UITextField *) txtRename
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_19 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "get_txtRename");
	}

	-(void) setTxtRename:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_20 (self, _cmd, &managed_method, p0, "UIKit.UITextField, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "set_txtRename");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) viewDidLayoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.CategoryVC, JD.iPhone", "ViewDidLayoutSubviews");
	}

	-(void) BtnBack_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "BtnBack_TouchUpInside");
	}

	-(void) BtnAction_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "BtnAction_TouchUpInside");
	}

	-(void) BtnSortOption_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "BtnSortOption_TouchUpInside");
	}

	-(void) SortMenuClose:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "SortMenuClose");
	}

	-(void) actionMenuClose:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "actionMenuClose");
	}

	-(void) viewOptionChange:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "viewOptionChange");
	}

	-(void) BtnRename_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "BtnRename_TouchUpInside");
	}

	-(void) BtnShare_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "BtnShare_TouchUpInside");
	}

	-(void) BtnDelete_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "BtnDelete_TouchUpInside");
	}

	-(void) BtnRenameYes_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "BtnRenameYes_TouchUpInside");
	}

	-(void) BtnRenameCancel_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "BtnRenameCancel_TouchUpInside");
	}

	-(void) BtnDeleteYes_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "BtnDeleteYes_TouchUpInside");
	}

	-(void) BtnDeleteCancel_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategoryVC, JD.iPhone", "BtnDeleteCancel_TouchUpInside");
	}
@end

@interface SearchCell : UITableViewCell {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation SearchCell { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface JD_iPhone_ProfileTableSource : NSObject<UIScrollViewDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation JD_iPhone_ProfileTableSource { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_22 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.ProfileTableSource, JD.iPhone", "GetCell");
	}

	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "System.nint, Xamarin.iOS", "JD.iPhone.ProfileTableSource, JD.iPhone", "RowsInSection");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface ProfileVC : BaseVC {
}
	@property (nonatomic, assign) UIButton * btnBack;
	@property (nonatomic, assign) UIButton * btnChangePhoto;
	@property (nonatomic, assign) UIView * navBarView;
	@property (nonatomic, assign) UITableView * table;
	-(UIButton *) btnBack;
	-(void) setBtnBack:(UIButton *)p0;
	-(UIButton *) btnChangePhoto;
	-(void) setBtnChangePhoto:(UIButton *)p0;
	-(UIView *) navBarView;
	-(void) setNavBarView:(UIView *)p0;
	-(UITableView *) table;
	-(void) setTable:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) didReceiveMemoryWarning;
	-(void) viewDidLayoutSubviews;
	-(void) BtnBack_TouchUpInside:(UIButton *)p0;
	-(void) BtnChangePhoto_TouchUpInside:(UIButton *)p0;
@end
@implementation ProfileVC { } 

	-(UIButton *) btnBack
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.ProfileVC, JD.iPhone", "get_btnBack");
	}

	-(void) setBtnBack:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.ProfileVC, JD.iPhone", "set_btnBack");
	}

	-(UIButton *) btnChangePhoto
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.ProfileVC, JD.iPhone", "get_btnChangePhoto");
	}

	-(void) setBtnChangePhoto:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.ProfileVC, JD.iPhone", "set_btnChangePhoto");
	}

	-(UIView *) navBarView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.ProfileVC, JD.iPhone", "get_navBarView");
	}

	-(void) setNavBarView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.ProfileVC, JD.iPhone", "set_navBarView");
	}

	-(UITableView *) table
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_17 (self, _cmd, &managed_method, "JD.iPhone.ProfileVC, JD.iPhone", "get_table");
	}

	-(void) setTable:(UITableView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_18 (self, _cmd, &managed_method, p0, "UIKit.UITableView, Xamarin.iOS", "JD.iPhone.ProfileVC, JD.iPhone", "set_table");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.ProfileVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) didReceiveMemoryWarning
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.ProfileVC, JD.iPhone", "DidReceiveMemoryWarning");
	}

	-(void) viewDidLayoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.ProfileVC, JD.iPhone", "ViewDidLayoutSubviews");
	}

	-(void) BtnBack_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.ProfileVC, JD.iPhone", "BtnBack_TouchUpInside");
	}

	-(void) BtnChangePhoto_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.ProfileVC, JD.iPhone", "BtnChangePhoto_TouchUpInside");
	}
@end

@interface ProfileCell : UITableViewCell {
	XamarinObject __monoObjectGCHandle;
}
	@property (nonatomic, assign) UITextField * content;
	@property (nonatomic, assign) UIImageView * itemImage;
	@property (nonatomic, assign) UILabel * label;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UITextField *) content;
	-(void) setContent:(UITextField *)p0;
	-(UIImageView *) itemImage;
	-(void) setItemImage:(UIImageView *)p0;
	-(UILabel *) label;
	-(void) setLabel:(UILabel *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation ProfileCell { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UITextField *) content
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_19 (self, _cmd, &managed_method, "JD.iPhone.ProfileCell, JD.iPhone", "get_content");
	}

	-(void) setContent:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_20 (self, _cmd, &managed_method, p0, "UIKit.UITextField, Xamarin.iOS", "JD.iPhone.ProfileCell, JD.iPhone", "set_content");
	}

	-(UIImageView *) itemImage
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_24 (self, _cmd, &managed_method, "JD.iPhone.ProfileCell, JD.iPhone", "get_itemImage");
	}

	-(void) setItemImage:(UIImageView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_25 (self, _cmd, &managed_method, p0, "UIKit.UIImageView, Xamarin.iOS", "JD.iPhone.ProfileCell, JD.iPhone", "set_itemImage");
	}

	-(UILabel *) label
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.ProfileCell, JD.iPhone", "get_label");
	}

	-(void) setLabel:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.ProfileCell, JD.iPhone", "set_label");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface JD_iPhone_NotificationTableSource : NSObject<UIScrollViewDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation JD_iPhone_NotificationTableSource { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_22 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.NotificationTableSource, JD.iPhone", "GetCell");
	}

	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "System.nint, Xamarin.iOS", "JD.iPhone.NotificationTableSource, JD.iPhone", "RowsInSection");
	}

	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_28 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.NotificationTableSource, JD.iPhone", "RowSelected");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface NotificationVC : BaseVC {
}
	@property (nonatomic, assign) UIButton * btnBack;
	@property (nonatomic, assign) UIView * navBarView;
	@property (nonatomic, assign) UITableView * table;
	-(UIButton *) btnBack;
	-(void) setBtnBack:(UIButton *)p0;
	-(UIView *) navBarView;
	-(void) setNavBarView:(UIView *)p0;
	-(UITableView *) table;
	-(void) setTable:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) didReceiveMemoryWarning;
	-(void) viewDidLayoutSubviews;
	-(void) BtnBack_TouchUpInside:(UIButton *)p0;
@end
@implementation NotificationVC { } 

	-(UIButton *) btnBack
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.NotificationVC, JD.iPhone", "get_btnBack");
	}

	-(void) setBtnBack:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.NotificationVC, JD.iPhone", "set_btnBack");
	}

	-(UIView *) navBarView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.NotificationVC, JD.iPhone", "get_navBarView");
	}

	-(void) setNavBarView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.NotificationVC, JD.iPhone", "set_navBarView");
	}

	-(UITableView *) table
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_17 (self, _cmd, &managed_method, "JD.iPhone.NotificationVC, JD.iPhone", "get_table");
	}

	-(void) setTable:(UITableView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_18 (self, _cmd, &managed_method, p0, "UIKit.UITableView, Xamarin.iOS", "JD.iPhone.NotificationVC, JD.iPhone", "set_table");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.NotificationVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) didReceiveMemoryWarning
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.NotificationVC, JD.iPhone", "DidReceiveMemoryWarning");
	}

	-(void) viewDidLayoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.NotificationVC, JD.iPhone", "ViewDidLayoutSubviews");
	}

	-(void) BtnBack_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.NotificationVC, JD.iPhone", "BtnBack_TouchUpInside");
	}
@end

@interface LoginVC : UIViewController {
	XamarinObject __monoObjectGCHandle;
}
	@property (nonatomic, assign) UIButton * btnCreate;
	@property (nonatomic, assign) UIButton * btnForgot;
	@property (nonatomic, assign) UIButton * btnSignin;
	@property (nonatomic, assign) UITextField * txtEmail;
	@property (nonatomic, assign) UITextField * txtPassword;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIButton *) btnCreate;
	-(void) setBtnCreate:(UIButton *)p0;
	-(UIButton *) btnForgot;
	-(void) setBtnForgot:(UIButton *)p0;
	-(UIButton *) btnSignin;
	-(void) setBtnSignin:(UIButton *)p0;
	-(UITextField *) txtEmail;
	-(void) setTxtEmail:(UITextField *)p0;
	-(UITextField *) txtPassword;
	-(void) setTxtPassword:(UITextField *)p0;
	-(void) BtnSignin_TouchUpInside:(UIButton *)p0;
	-(void) viewWillAppear:(BOOL)p0;
	-(void) viewDidLoad;
	-(void) didReceiveMemoryWarning;
	-(void) BtnForgot_TouchUpInside:(UIButton *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation LoginVC { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UIButton *) btnCreate
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.LoginVC, JD.iPhone", "get_btnCreate");
	}

	-(void) setBtnCreate:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.LoginVC, JD.iPhone", "set_btnCreate");
	}

	-(UIButton *) btnForgot
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.LoginVC, JD.iPhone", "get_btnForgot");
	}

	-(void) setBtnForgot:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.LoginVC, JD.iPhone", "set_btnForgot");
	}

	-(UIButton *) btnSignin
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.LoginVC, JD.iPhone", "get_btnSignin");
	}

	-(void) setBtnSignin:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.LoginVC, JD.iPhone", "set_btnSignin");
	}

	-(UITextField *) txtEmail
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_19 (self, _cmd, &managed_method, "JD.iPhone.LoginVC, JD.iPhone", "get_txtEmail");
	}

	-(void) setTxtEmail:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_20 (self, _cmd, &managed_method, p0, "UIKit.UITextField, Xamarin.iOS", "JD.iPhone.LoginVC, JD.iPhone", "set_txtEmail");
	}

	-(UITextField *) txtPassword
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_19 (self, _cmd, &managed_method, "JD.iPhone.LoginVC, JD.iPhone", "get_txtPassword");
	}

	-(void) setTxtPassword:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_20 (self, _cmd, &managed_method, p0, "UIKit.UITextField, Xamarin.iOS", "JD.iPhone.LoginVC, JD.iPhone", "set_txtPassword");
	}

	-(void) BtnSignin_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.LoginVC, JD.iPhone", "BtnSignin_TouchUpInside");
	}

	-(void) viewWillAppear:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_31 (self, _cmd, &managed_method, p0, "System.Boolean, mscorlib", "JD.iPhone.LoginVC, JD.iPhone", "ViewWillAppear");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.LoginVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) didReceiveMemoryWarning
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.LoginVC, JD.iPhone", "DidReceiveMemoryWarning");
	}

	-(void) BtnForgot_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.LoginVC, JD.iPhone", "BtnForgot_TouchUpInside");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface CheckCell : UITableViewCell {
	XamarinObject __monoObjectGCHandle;
}
	@property (nonatomic, assign) UIButton * btnCheck;
	@property (nonatomic, assign) UILabel * lblText;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIButton *) btnCheck;
	-(void) setBtnCheck:(UIButton *)p0;
	-(UILabel *) lblText;
	-(void) setLblText:(UILabel *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation CheckCell { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UIButton *) btnCheck
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CheckCell, JD.iPhone", "get_btnCheck");
	}

	-(void) setBtnCheck:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CheckCell, JD.iPhone", "set_btnCheck");
	}

	-(UILabel *) lblText
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.CheckCell, JD.iPhone", "get_lblText");
	}

	-(void) setLblText:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.CheckCell, JD.iPhone", "set_lblText");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface JD_iPhone_TableSource : NSObject<UIScrollViewDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation JD_iPhone_TableSource { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_22 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.TableSource, JD.iPhone", "GetCell");
	}

	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "System.nint, Xamarin.iOS", "JD.iPhone.TableSource, JD.iPhone", "RowsInSection");
	}

	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_28 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.TableSource, JD.iPhone", "RowSelected");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface CategoryCollectionCell : UICollectionViewCell {
	XamarinObject __monoObjectGCHandle;
}
	@property (nonatomic, assign) UIView * banner;
	@property (nonatomic, assign) UILabel * categoryName;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIView *) banner;
	-(void) setBanner:(UIView *)p0;
	-(UILabel *) categoryName;
	-(void) setCategoryName:(UILabel *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation CategoryCollectionCell { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UIView *) banner
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.CategoryCollectionCell, JD.iPhone", "get_banner");
	}

	-(void) setBanner:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.CategoryCollectionCell, JD.iPhone", "set_banner");
	}

	-(UILabel *) categoryName
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.CategoryCollectionCell, JD.iPhone", "get_categoryName");
	}

	-(void) setCategoryName:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.CategoryCollectionCell, JD.iPhone", "set_categoryName");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface ThankyouVC : UIViewController {
	XamarinObject __monoObjectGCHandle;
}
	@property (nonatomic, assign) UIButton * btnGoHome;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIButton *) btnGoHome;
	-(void) setBtnGoHome:(UIButton *)p0;
	-(void) BtnGoHome_TouchUpInside:(UIButton *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation ThankyouVC { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UIButton *) btnGoHome
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.ThankyouVC, JD.iPhone", "get_btnGoHome");
	}

	-(void) setBtnGoHome:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.ThankyouVC, JD.iPhone", "set_btnGoHome");
	}

	-(void) BtnGoHome_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.ThankyouVC, JD.iPhone", "BtnGoHome_TouchUpInside");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface OnboardingVC : UIViewController {
	XamarinObject __monoObjectGCHandle;
}
	@property (nonatomic, assign) UIView * bottomView;
	@property (nonatomic, assign) UIButton * btnLogin;
	@property (nonatomic, assign) UIButton * btnSignUp;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIView *) bottomView;
	-(void) setBottomView:(UIView *)p0;
	-(UIButton *) btnLogin;
	-(void) setBtnLogin:(UIButton *)p0;
	-(UIButton *) btnSignUp;
	-(void) setBtnSignUp:(UIButton *)p0;
	-(void) viewDidLoad;
	-(void) BtnSignUp_TouchUpInside:(UIButton *)p0;
	-(void) BtnLogin_TouchUpInside:(UIButton *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation OnboardingVC { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UIView *) bottomView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.OnboardingVC, JD.iPhone", "get_bottomView");
	}

	-(void) setBottomView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.OnboardingVC, JD.iPhone", "set_bottomView");
	}

	-(UIButton *) btnLogin
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.OnboardingVC, JD.iPhone", "get_btnLogin");
	}

	-(void) setBtnLogin:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.OnboardingVC, JD.iPhone", "set_btnLogin");
	}

	-(UIButton *) btnSignUp
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.OnboardingVC, JD.iPhone", "get_btnSignUp");
	}

	-(void) setBtnSignUp:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.OnboardingVC, JD.iPhone", "set_btnSignUp");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.OnboardingVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) BtnSignUp_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.OnboardingVC, JD.iPhone", "BtnSignUp_TouchUpInside");
	}

	-(void) BtnLogin_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.OnboardingVC, JD.iPhone", "BtnLogin_TouchUpInside");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface MainTapBarVC : UITabBarController {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation MainTapBarVC { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.MainTapBarVC, JD.iPhone", "ViewDidLoad");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface MainTabMenuVC : UIViewController {
	XamarinObject __monoObjectGCHandle;
}
	@property (nonatomic, assign) UIButton * btnMenuClose;
	@property (nonatomic, assign) UIButton * btnOpenCategory;
	@property (nonatomic, assign) UIButton * btnOpenDocument;
	@property (nonatomic, assign) UIView * createNewMenu;
	@property (nonatomic, assign) UIView * spaceView;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIButton *) btnMenuClose;
	-(void) setBtnMenuClose:(UIButton *)p0;
	-(UIButton *) btnOpenCategory;
	-(void) setBtnOpenCategory:(UIButton *)p0;
	-(UIButton *) btnOpenDocument;
	-(void) setBtnOpenDocument:(UIButton *)p0;
	-(UIView *) createNewMenu;
	-(void) setCreateNewMenu:(UIView *)p0;
	-(UIView *) spaceView;
	-(void) setSpaceView:(UIView *)p0;
	-(void) viewDidLoad;
	-(void) BtnOpenCategory_TouchUpInside:(UIButton *)p0;
	-(void) BtnOpenDocument_TouchUpInside:(UIButton *)p0;
	-(void) BtnMenuClose_TouchUpInside:(UIButton *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation MainTabMenuVC { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UIButton *) btnMenuClose
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.MainTabMenuVC, JD.iPhone", "get_btnMenuClose");
	}

	-(void) setBtnMenuClose:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.MainTabMenuVC, JD.iPhone", "set_btnMenuClose");
	}

	-(UIButton *) btnOpenCategory
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.MainTabMenuVC, JD.iPhone", "get_btnOpenCategory");
	}

	-(void) setBtnOpenCategory:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.MainTabMenuVC, JD.iPhone", "set_btnOpenCategory");
	}

	-(UIButton *) btnOpenDocument
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.MainTabMenuVC, JD.iPhone", "get_btnOpenDocument");
	}

	-(void) setBtnOpenDocument:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.MainTabMenuVC, JD.iPhone", "set_btnOpenDocument");
	}

	-(UIView *) createNewMenu
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.MainTabMenuVC, JD.iPhone", "get_createNewMenu");
	}

	-(void) setCreateNewMenu:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.MainTabMenuVC, JD.iPhone", "set_createNewMenu");
	}

	-(UIView *) spaceView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.MainTabMenuVC, JD.iPhone", "get_spaceView");
	}

	-(void) setSpaceView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.MainTabMenuVC, JD.iPhone", "set_spaceView");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.MainTabMenuVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) BtnOpenCategory_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.MainTabMenuVC, JD.iPhone", "BtnOpenCategory_TouchUpInside");
	}

	-(void) BtnOpenDocument_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.MainTabMenuVC, JD.iPhone", "BtnOpenDocument_TouchUpInside");
	}

	-(void) BtnMenuClose_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.MainTabMenuVC, JD.iPhone", "BtnMenuClose_TouchUpInside");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface JD_iPhone_SingleFileTableSource : NSObject<UIScrollViewDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation JD_iPhone_SingleFileTableSource { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_22 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.SingleFileTableSource, JD.iPhone", "GetCell");
	}

	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "System.nint, Xamarin.iOS", "JD.iPhone.SingleFileTableSource, JD.iPhone", "RowsInSection");
	}

	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_28 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.SingleFileTableSource, JD.iPhone", "RowSelected");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface CategorySingleFileVC : BaseVC {
}
	@property (nonatomic, assign) UIButton * btnBack;
	@property (nonatomic, assign) UIButton * btnMore;
	@property (nonatomic, assign) UIView * gradientView;
	@property (nonatomic, assign) UILabel * navTitle;
	@property (nonatomic, assign) UIView * navView;
	@property (nonatomic, assign) UIView * profileView;
	@property (nonatomic, assign) UITableView * table;
	-(UIButton *) btnBack;
	-(void) setBtnBack:(UIButton *)p0;
	-(UIButton *) btnMore;
	-(void) setBtnMore:(UIButton *)p0;
	-(UIView *) gradientView;
	-(void) setGradientView:(UIView *)p0;
	-(UILabel *) navTitle;
	-(void) setNavTitle:(UILabel *)p0;
	-(UIView *) navView;
	-(void) setNavView:(UIView *)p0;
	-(UIView *) profileView;
	-(void) setProfileView:(UIView *)p0;
	-(UITableView *) table;
	-(void) setTable:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidLayoutSubviews;
	-(void) BtnBack_TouchUpInside:(UIButton *)p0;
@end
@implementation CategorySingleFileVC { } 

	-(UIButton *) btnBack
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CategorySingleFileVC, JD.iPhone", "get_btnBack");
	}

	-(void) setBtnBack:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategorySingleFileVC, JD.iPhone", "set_btnBack");
	}

	-(UIButton *) btnMore
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CategorySingleFileVC, JD.iPhone", "get_btnMore");
	}

	-(void) setBtnMore:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategorySingleFileVC, JD.iPhone", "set_btnMore");
	}

	-(UIView *) gradientView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.CategorySingleFileVC, JD.iPhone", "get_gradientView");
	}

	-(void) setGradientView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.CategorySingleFileVC, JD.iPhone", "set_gradientView");
	}

	-(UILabel *) navTitle
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.CategorySingleFileVC, JD.iPhone", "get_navTitle");
	}

	-(void) setNavTitle:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.CategorySingleFileVC, JD.iPhone", "set_navTitle");
	}

	-(UIView *) navView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.CategorySingleFileVC, JD.iPhone", "get_navView");
	}

	-(void) setNavView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.CategorySingleFileVC, JD.iPhone", "set_navView");
	}

	-(UIView *) profileView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.CategorySingleFileVC, JD.iPhone", "get_profileView");
	}

	-(void) setProfileView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.CategorySingleFileVC, JD.iPhone", "set_profileView");
	}

	-(UITableView *) table
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_17 (self, _cmd, &managed_method, "JD.iPhone.CategorySingleFileVC, JD.iPhone", "get_table");
	}

	-(void) setTable:(UITableView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_18 (self, _cmd, &managed_method, p0, "UIKit.UITableView, Xamarin.iOS", "JD.iPhone.CategorySingleFileVC, JD.iPhone", "set_table");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.CategorySingleFileVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) viewDidLayoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.CategorySingleFileVC, JD.iPhone", "ViewDidLayoutSubviews");
	}

	-(void) BtnBack_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CategorySingleFileVC, JD.iPhone", "BtnBack_TouchUpInside");
	}
@end

@interface SingleCategoryCell : UITableViewCell {
	XamarinObject __monoObjectGCHandle;
}
	@property (nonatomic, assign) UIScrollView * scrollView;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIScrollView *) scrollView;
	-(void) setScrollView:(UIScrollView *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation SingleCategoryCell { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UIScrollView *) scrollView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_26 (self, _cmd, &managed_method, "JD.iPhone.SingleCategoryCell, JD.iPhone", "get_scrollView");
	}

	-(void) setScrollView:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_27 (self, _cmd, &managed_method, p0, "UIKit.UIScrollView, Xamarin.iOS", "JD.iPhone.SingleCategoryCell, JD.iPhone", "set_scrollView");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface CameraVC : UIViewController {
	XamarinObject __monoObjectGCHandle;
}
	@property (nonatomic, assign) UIButton * btnBack;
	@property (nonatomic, assign) UIButton * btnCheck;
	@property (nonatomic, assign) UIButton * btnShutter;
	@property (nonatomic, assign) UIImageView * cameraView;
	@property (nonatomic, assign) UILabel * lblCount;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIButton *) btnBack;
	-(void) setBtnBack:(UIButton *)p0;
	-(UIButton *) btnCheck;
	-(void) setBtnCheck:(UIButton *)p0;
	-(UIButton *) btnShutter;
	-(void) setBtnShutter:(UIButton *)p0;
	-(UIImageView *) cameraView;
	-(void) setCameraView:(UIImageView *)p0;
	-(UILabel *) lblCount;
	-(void) setLblCount:(UILabel *)p0;
	-(void) BtnBack_TouchUpInside:(UIButton *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(void) viewWillDisappear:(BOOL)p0;
	-(void) BtnShutter_TouchUpInside:(UIButton *)p0;
	-(void) BtnCheck_TouchUpInside:(UIButton *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation CameraVC { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UIButton *) btnBack
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CameraVC, JD.iPhone", "get_btnBack");
	}

	-(void) setBtnBack:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CameraVC, JD.iPhone", "set_btnBack");
	}

	-(UIButton *) btnCheck
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CameraVC, JD.iPhone", "get_btnCheck");
	}

	-(void) setBtnCheck:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CameraVC, JD.iPhone", "set_btnCheck");
	}

	-(UIButton *) btnShutter
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CameraVC, JD.iPhone", "get_btnShutter");
	}

	-(void) setBtnShutter:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CameraVC, JD.iPhone", "set_btnShutter");
	}

	-(UIImageView *) cameraView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_24 (self, _cmd, &managed_method, "JD.iPhone.CameraVC, JD.iPhone", "get_cameraView");
	}

	-(void) setCameraView:(UIImageView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_25 (self, _cmd, &managed_method, p0, "UIKit.UIImageView, Xamarin.iOS", "JD.iPhone.CameraVC, JD.iPhone", "set_cameraView");
	}

	-(UILabel *) lblCount
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.CameraVC, JD.iPhone", "get_lblCount");
	}

	-(void) setLblCount:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.CameraVC, JD.iPhone", "set_lblCount");
	}

	-(void) BtnBack_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CameraVC, JD.iPhone", "BtnBack_TouchUpInside");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.CameraVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) viewDidAppear:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_31 (self, _cmd, &managed_method, p0, "System.Boolean, mscorlib", "JD.iPhone.CameraVC, JD.iPhone", "ViewDidAppear");
	}

	-(void) viewWillDisappear:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_31 (self, _cmd, &managed_method, p0, "System.Boolean, mscorlib", "JD.iPhone.CameraVC, JD.iPhone", "ViewWillDisappear");
	}

	-(void) BtnShutter_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CameraVC, JD.iPhone", "BtnShutter_TouchUpInside");
	}

	-(void) BtnCheck_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CameraVC, JD.iPhone", "BtnCheck_TouchUpInside");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface JD_iPhone_CEEditTableSource : NSObject<UIScrollViewDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation JD_iPhone_CEEditTableSource { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_22 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.CEEditTableSource, JD.iPhone", "GetCell");
	}

	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "System.nint, Xamarin.iOS", "JD.iPhone.CEEditTableSource, JD.iPhone", "RowsInSection");
	}

	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_28 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.CEEditTableSource, JD.iPhone", "RowSelected");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface CEEditContentsVC : BaseVC {
}
	@property (nonatomic, assign) UIButton * btnBack;
	@property (nonatomic, assign) UIView * navBarView;
	@property (nonatomic, assign) UITableView * table;
	-(UIButton *) btnBack;
	-(void) setBtnBack:(UIButton *)p0;
	-(UIView *) navBarView;
	-(void) setNavBarView:(UIView *)p0;
	-(UITableView *) table;
	-(void) setTable:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidLayoutSubviews;
	-(void) BtnBack_TouchUpInside:(UIButton *)p0;
@end
@implementation CEEditContentsVC { } 

	-(UIButton *) btnBack
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CEEditContentsVC, JD.iPhone", "get_btnBack");
	}

	-(void) setBtnBack:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CEEditContentsVC, JD.iPhone", "set_btnBack");
	}

	-(UIView *) navBarView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.CEEditContentsVC, JD.iPhone", "get_navBarView");
	}

	-(void) setNavBarView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.CEEditContentsVC, JD.iPhone", "set_navBarView");
	}

	-(UITableView *) table
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_17 (self, _cmd, &managed_method, "JD.iPhone.CEEditContentsVC, JD.iPhone", "get_table");
	}

	-(void) setTable:(UITableView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_18 (self, _cmd, &managed_method, p0, "UIKit.UITableView, Xamarin.iOS", "JD.iPhone.CEEditContentsVC, JD.iPhone", "set_table");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.CEEditContentsVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) viewDidLayoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.CEEditContentsVC, JD.iPhone", "ViewDidLayoutSubviews");
	}

	-(void) BtnBack_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CEEditContentsVC, JD.iPhone", "BtnBack_TouchUpInside");
	}
@end

@interface JD_iPhone_CESaveTableSource : NSObject<UIScrollViewDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation JD_iPhone_CESaveTableSource { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_22 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.CESaveTableSource, JD.iPhone", "GetCell");
	}

	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "System.nint, Xamarin.iOS", "JD.iPhone.CESaveTableSource, JD.iPhone", "RowsInSection");
	}

	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_28 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.CESaveTableSource, JD.iPhone", "RowSelected");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface CESaveContentsVC : BaseVC {
}
	@property (nonatomic, assign) UIButton * btnBack;
	@property (nonatomic, assign) UIButton * btnCancel;
	@property (nonatomic, assign) UIView * navBarView;
	@property (nonatomic, assign) UITableView * table;
	@property (nonatomic, assign) UIPageControl * pageControl;
	-(UIButton *) btnBack;
	-(void) setBtnBack:(UIButton *)p0;
	-(UIButton *) btnCancel;
	-(void) setBtnCancel:(UIButton *)p0;
	-(UIView *) navBarView;
	-(void) setNavBarView:(UIView *)p0;
	-(UITableView *) table;
	-(void) setTable:(UITableView *)p0;
	-(UIPageControl *) pageControl;
	-(void) setPageControl:(UIPageControl *)p0;
	-(void) viewDidLoad;
	-(void) viewDidLayoutSubviews;
	-(void) BtnBack_TouchUpInside:(UIButton *)p0;
	-(void) BtnCancel_TouchUpInside:(UIButton *)p0;
@end
@implementation CESaveContentsVC { } 

	-(UIButton *) btnBack
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CESaveContentsVC, JD.iPhone", "get_btnBack");
	}

	-(void) setBtnBack:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CESaveContentsVC, JD.iPhone", "set_btnBack");
	}

	-(UIButton *) btnCancel
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CESaveContentsVC, JD.iPhone", "get_btnCancel");
	}

	-(void) setBtnCancel:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CESaveContentsVC, JD.iPhone", "set_btnCancel");
	}

	-(UIView *) navBarView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.CESaveContentsVC, JD.iPhone", "get_navBarView");
	}

	-(void) setNavBarView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.CESaveContentsVC, JD.iPhone", "set_navBarView");
	}

	-(UITableView *) table
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_17 (self, _cmd, &managed_method, "JD.iPhone.CESaveContentsVC, JD.iPhone", "get_table");
	}

	-(void) setTable:(UITableView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_18 (self, _cmd, &managed_method, p0, "UIKit.UITableView, Xamarin.iOS", "JD.iPhone.CESaveContentsVC, JD.iPhone", "set_table");
	}

	-(UIPageControl *) pageControl
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_32 (self, _cmd, &managed_method, "JD.iPhone.CESaveContentsVC, JD.iPhone", "get_pageControl");
	}

	-(void) setPageControl:(UIPageControl *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_33 (self, _cmd, &managed_method, p0, "UIKit.UIPageControl, Xamarin.iOS", "JD.iPhone.CESaveContentsVC, JD.iPhone", "set_pageControl");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.CESaveContentsVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) viewDidLayoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.CESaveContentsVC, JD.iPhone", "ViewDidLayoutSubviews");
	}

	-(void) BtnBack_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CESaveContentsVC, JD.iPhone", "BtnBack_TouchUpInside");
	}

	-(void) BtnCancel_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CESaveContentsVC, JD.iPhone", "BtnCancel_TouchUpInside");
	}
@end

@interface PhotoCroppingVC : UIViewController {
	XamarinObject __monoObjectGCHandle;
}
	@property (nonatomic, assign) UIButton * btnBack;
	@property (nonatomic, assign) UIButton * btnCancel;
	@property (nonatomic, assign) UIButton * btnDelete;
	@property (nonatomic, assign) UIButton * btnNext;
	@property (nonatomic, assign) UIButton * btnRotate;
	@property (nonatomic, assign) UIView * cropView;
	@property (nonatomic, assign) UILabel * lblCount;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIButton *) btnBack;
	-(void) setBtnBack:(UIButton *)p0;
	-(UIButton *) btnCancel;
	-(void) setBtnCancel:(UIButton *)p0;
	-(UIButton *) btnDelete;
	-(void) setBtnDelete:(UIButton *)p0;
	-(UIButton *) btnNext;
	-(void) setBtnNext:(UIButton *)p0;
	-(UIButton *) btnRotate;
	-(void) setBtnRotate:(UIButton *)p0;
	-(UIView *) cropView;
	-(void) setCropView:(UIView *)p0;
	-(UILabel *) lblCount;
	-(void) setLblCount:(UILabel *)p0;
	-(void) viewDidLoad;
	-(void) BtnNext_TouchUpInside:(UIButton *)p0;
	-(void) BtnBack_TouchUpInside:(UIButton *)p0;
	-(void) BtnCancel_TouchUpInside:(UIButton *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation PhotoCroppingVC { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UIButton *) btnBack
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.PhotoCroppingVC, JD.iPhone", "get_btnBack");
	}

	-(void) setBtnBack:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.PhotoCroppingVC, JD.iPhone", "set_btnBack");
	}

	-(UIButton *) btnCancel
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.PhotoCroppingVC, JD.iPhone", "get_btnCancel");
	}

	-(void) setBtnCancel:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.PhotoCroppingVC, JD.iPhone", "set_btnCancel");
	}

	-(UIButton *) btnDelete
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.PhotoCroppingVC, JD.iPhone", "get_btnDelete");
	}

	-(void) setBtnDelete:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.PhotoCroppingVC, JD.iPhone", "set_btnDelete");
	}

	-(UIButton *) btnNext
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.PhotoCroppingVC, JD.iPhone", "get_btnNext");
	}

	-(void) setBtnNext:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.PhotoCroppingVC, JD.iPhone", "set_btnNext");
	}

	-(UIButton *) btnRotate
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.PhotoCroppingVC, JD.iPhone", "get_btnRotate");
	}

	-(void) setBtnRotate:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.PhotoCroppingVC, JD.iPhone", "set_btnRotate");
	}

	-(UIView *) cropView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.PhotoCroppingVC, JD.iPhone", "get_cropView");
	}

	-(void) setCropView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.PhotoCroppingVC, JD.iPhone", "set_cropView");
	}

	-(UILabel *) lblCount
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.PhotoCroppingVC, JD.iPhone", "get_lblCount");
	}

	-(void) setLblCount:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.PhotoCroppingVC, JD.iPhone", "set_lblCount");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.PhotoCroppingVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) BtnNext_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.PhotoCroppingVC, JD.iPhone", "BtnNext_TouchUpInside");
	}

	-(void) BtnBack_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.PhotoCroppingVC, JD.iPhone", "BtnBack_TouchUpInside");
	}

	-(void) BtnCancel_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.PhotoCroppingVC, JD.iPhone", "BtnCancel_TouchUpInside");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface JD_iPhone_ResizingFrame : UIView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) touchesBegan:(NSSet *)p0 withEvent:(UIEvent *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end
@implementation JD_iPhone_ResizingFrame { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) touchesBegan:(NSSet *)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_34 (self, _cmd, &managed_method, p0, p1, "Foundation.NSSet, Xamarin.iOS", "UIKit.UIEvent, Xamarin.iOS", "JD.iPhone.ResizingFrame, JD.iPhone", "TouchesBegan");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_8 (self, _cmd, &managed_method, "JD.iPhone.ResizingFrame, JD.iPhone", ".ctor", &call_super);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UIView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface RegistrationVC : BaseVC {
}
	@property (nonatomic, assign) UIButton * btnClose;
	@property (nonatomic, assign) UIButton * btnFBlogin;
	@property (nonatomic, assign) UIButton * btnGoogleLogin;
	@property (nonatomic, assign) UIButton * btnSignup;
	@property (nonatomic, assign) UIImageView * imgPhoto;
	@property (nonatomic, assign) UITextField * txtEmail;
	@property (nonatomic, assign) UITextField * txtFullName;
	@property (nonatomic, assign) UITextField * txtPassword;
	@property (nonatomic, assign) UITextField * txtZipCode;
	-(UIButton *) btnClose;
	-(void) setBtnClose:(UIButton *)p0;
	-(UIButton *) btnFBlogin;
	-(void) setBtnFBlogin:(UIButton *)p0;
	-(UIButton *) btnGoogleLogin;
	-(void) setBtnGoogleLogin:(UIButton *)p0;
	-(UIButton *) btnSignup;
	-(void) setBtnSignup:(UIButton *)p0;
	-(UIImageView *) imgPhoto;
	-(void) setImgPhoto:(UIImageView *)p0;
	-(UITextField *) txtEmail;
	-(void) setTxtEmail:(UITextField *)p0;
	-(UITextField *) txtFullName;
	-(void) setTxtFullName:(UITextField *)p0;
	-(UITextField *) txtPassword;
	-(void) setTxtPassword:(UITextField *)p0;
	-(UITextField *) txtZipCode;
	-(void) setTxtZipCode:(UITextField *)p0;
	-(void) BtnSignup_TouchUpInside:(UIButton *)p0;
	-(void) BtnClose_TouchUpInside:(UIButton *)p0;
	-(void) viewDidLoad;
	-(void) didReceiveMemoryWarning;
@end
@implementation RegistrationVC { } 

	-(UIButton *) btnClose
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.RegistrationVC, JD.iPhone", "get_btnClose");
	}

	-(void) setBtnClose:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.RegistrationVC, JD.iPhone", "set_btnClose");
	}

	-(UIButton *) btnFBlogin
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.RegistrationVC, JD.iPhone", "get_btnFBlogin");
	}

	-(void) setBtnFBlogin:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.RegistrationVC, JD.iPhone", "set_btnFBlogin");
	}

	-(UIButton *) btnGoogleLogin
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.RegistrationVC, JD.iPhone", "get_btnGoogleLogin");
	}

	-(void) setBtnGoogleLogin:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.RegistrationVC, JD.iPhone", "set_btnGoogleLogin");
	}

	-(UIButton *) btnSignup
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.RegistrationVC, JD.iPhone", "get_btnSignup");
	}

	-(void) setBtnSignup:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.RegistrationVC, JD.iPhone", "set_btnSignup");
	}

	-(UIImageView *) imgPhoto
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_24 (self, _cmd, &managed_method, "JD.iPhone.RegistrationVC, JD.iPhone", "get_imgPhoto");
	}

	-(void) setImgPhoto:(UIImageView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_25 (self, _cmd, &managed_method, p0, "UIKit.UIImageView, Xamarin.iOS", "JD.iPhone.RegistrationVC, JD.iPhone", "set_imgPhoto");
	}

	-(UITextField *) txtEmail
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_19 (self, _cmd, &managed_method, "JD.iPhone.RegistrationVC, JD.iPhone", "get_txtEmail");
	}

	-(void) setTxtEmail:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_20 (self, _cmd, &managed_method, p0, "UIKit.UITextField, Xamarin.iOS", "JD.iPhone.RegistrationVC, JD.iPhone", "set_txtEmail");
	}

	-(UITextField *) txtFullName
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_19 (self, _cmd, &managed_method, "JD.iPhone.RegistrationVC, JD.iPhone", "get_txtFullName");
	}

	-(void) setTxtFullName:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_20 (self, _cmd, &managed_method, p0, "UIKit.UITextField, Xamarin.iOS", "JD.iPhone.RegistrationVC, JD.iPhone", "set_txtFullName");
	}

	-(UITextField *) txtPassword
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_19 (self, _cmd, &managed_method, "JD.iPhone.RegistrationVC, JD.iPhone", "get_txtPassword");
	}

	-(void) setTxtPassword:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_20 (self, _cmd, &managed_method, p0, "UIKit.UITextField, Xamarin.iOS", "JD.iPhone.RegistrationVC, JD.iPhone", "set_txtPassword");
	}

	-(UITextField *) txtZipCode
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_19 (self, _cmd, &managed_method, "JD.iPhone.RegistrationVC, JD.iPhone", "get_txtZipCode");
	}

	-(void) setTxtZipCode:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_20 (self, _cmd, &managed_method, p0, "UIKit.UITextField, Xamarin.iOS", "JD.iPhone.RegistrationVC, JD.iPhone", "set_txtZipCode");
	}

	-(void) BtnSignup_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.RegistrationVC, JD.iPhone", "BtnSignup_TouchUpInside");
	}

	-(void) BtnClose_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.RegistrationVC, JD.iPhone", "BtnClose_TouchUpInside");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.RegistrationVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) didReceiveMemoryWarning
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.RegistrationVC, JD.iPhone", "DidReceiveMemoryWarning");
	}
@end

@interface JD_iPhone_JobTableSource : NSObject<UIScrollViewDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation JD_iPhone_JobTableSource { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_22 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.JobTableSource, JD.iPhone", "GetCell");
	}

	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "System.nint, Xamarin.iOS", "JD.iPhone.JobTableSource, JD.iPhone", "RowsInSection");
	}

	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_28 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.JobTableSource, JD.iPhone", "RowSelected");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface JD_iPhone_RoleTablesource : NSObject<UIScrollViewDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation JD_iPhone_RoleTablesource { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_22 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.RoleTablesource, JD.iPhone", "GetCell");
	}

	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "System.nint, Xamarin.iOS", "JD.iPhone.RoleTablesource, JD.iPhone", "RowsInSection");
	}

	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_28 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.RoleTablesource, JD.iPhone", "RowSelected");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface SelectRoleVC : BaseVC {
}
	@property (nonatomic, assign) UIButton * btnBack;
	@property (nonatomic, assign) UIButton * btnNext;
	@property (nonatomic, assign) UIView * navBarView;
	@property (nonatomic, assign) UISearchBar * searchBar;
	@property (nonatomic, assign) UITableView * table;
	-(UIButton *) btnBack;
	-(void) setBtnBack:(UIButton *)p0;
	-(UIButton *) btnNext;
	-(void) setBtnNext:(UIButton *)p0;
	-(UIView *) navBarView;
	-(void) setNavBarView:(UIView *)p0;
	-(UISearchBar *) searchBar;
	-(void) setSearchBar:(UISearchBar *)p0;
	-(UITableView *) table;
	-(void) setTable:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidLayoutSubviews;
	-(void) BtnBack_TouchUpInside:(UIButton *)p0;
	-(void) BtnNext_TouchUpInside:(UIButton *)p0;
@end
@implementation SelectRoleVC { } 

	-(UIButton *) btnBack
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.SelectRoleVC, JD.iPhone", "get_btnBack");
	}

	-(void) setBtnBack:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.SelectRoleVC, JD.iPhone", "set_btnBack");
	}

	-(UIButton *) btnNext
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.SelectRoleVC, JD.iPhone", "get_btnNext");
	}

	-(void) setBtnNext:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.SelectRoleVC, JD.iPhone", "set_btnNext");
	}

	-(UIView *) navBarView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.SelectRoleVC, JD.iPhone", "get_navBarView");
	}

	-(void) setNavBarView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.SelectRoleVC, JD.iPhone", "set_navBarView");
	}

	-(UISearchBar *) searchBar
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_29 (self, _cmd, &managed_method, "JD.iPhone.SelectRoleVC, JD.iPhone", "get_searchBar");
	}

	-(void) setSearchBar:(UISearchBar *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_30 (self, _cmd, &managed_method, p0, "UIKit.UISearchBar, Xamarin.iOS", "JD.iPhone.SelectRoleVC, JD.iPhone", "set_searchBar");
	}

	-(UITableView *) table
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_17 (self, _cmd, &managed_method, "JD.iPhone.SelectRoleVC, JD.iPhone", "get_table");
	}

	-(void) setTable:(UITableView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_18 (self, _cmd, &managed_method, p0, "UIKit.UITableView, Xamarin.iOS", "JD.iPhone.SelectRoleVC, JD.iPhone", "set_table");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.SelectRoleVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) viewDidLayoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.SelectRoleVC, JD.iPhone", "ViewDidLayoutSubviews");
	}

	-(void) BtnBack_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.SelectRoleVC, JD.iPhone", "BtnBack_TouchUpInside");
	}

	-(void) BtnNext_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.SelectRoleVC, JD.iPhone", "BtnNext_TouchUpInside");
	}
@end

@interface JD_iPhone_SaveLocationSource : NSObject<UIScrollViewDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation JD_iPhone_SaveLocationSource { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_22 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.SaveLocationSource, JD.iPhone", "GetCell");
	}

	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "System.nint, Xamarin.iOS", "JD.iPhone.SaveLocationSource, JD.iPhone", "RowsInSection");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface SaveLocationVC : BaseVC {
}
	@property (nonatomic, assign) UIView * bottomFrameView;
	@property (nonatomic, assign) UIButton * btnBack;
	@property (nonatomic, assign) UIButton * btnCancel;
	@property (nonatomic, assign) UIView * navBarView;
	@property (nonatomic, assign) UITableView * table;
	-(UIView *) bottomFrameView;
	-(void) setBottomFrameView:(UIView *)p0;
	-(UIButton *) btnBack;
	-(void) setBtnBack:(UIButton *)p0;
	-(UIButton *) btnCancel;
	-(void) setBtnCancel:(UIButton *)p0;
	-(UIView *) navBarView;
	-(void) setNavBarView:(UIView *)p0;
	-(UITableView *) table;
	-(void) setTable:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidLayoutSubviews;
	-(void) didReceiveMemoryWarning;
	-(void) BtnCancel_TouchUpInside:(UIButton *)p0;
	-(void) BtnBack_TouchUpInside:(UIButton *)p0;
@end
@implementation SaveLocationVC { } 

	-(UIView *) bottomFrameView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.SaveLocationVC, JD.iPhone", "get_bottomFrameView");
	}

	-(void) setBottomFrameView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.SaveLocationVC, JD.iPhone", "set_bottomFrameView");
	}

	-(UIButton *) btnBack
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.SaveLocationVC, JD.iPhone", "get_btnBack");
	}

	-(void) setBtnBack:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.SaveLocationVC, JD.iPhone", "set_btnBack");
	}

	-(UIButton *) btnCancel
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.SaveLocationVC, JD.iPhone", "get_btnCancel");
	}

	-(void) setBtnCancel:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.SaveLocationVC, JD.iPhone", "set_btnCancel");
	}

	-(UIView *) navBarView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.SaveLocationVC, JD.iPhone", "get_navBarView");
	}

	-(void) setNavBarView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.SaveLocationVC, JD.iPhone", "set_navBarView");
	}

	-(UITableView *) table
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_17 (self, _cmd, &managed_method, "JD.iPhone.SaveLocationVC, JD.iPhone", "get_table");
	}

	-(void) setTable:(UITableView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_18 (self, _cmd, &managed_method, p0, "UIKit.UITableView, Xamarin.iOS", "JD.iPhone.SaveLocationVC, JD.iPhone", "set_table");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.SaveLocationVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) viewDidLayoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.SaveLocationVC, JD.iPhone", "ViewDidLayoutSubviews");
	}

	-(void) didReceiveMemoryWarning
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.SaveLocationVC, JD.iPhone", "DidReceiveMemoryWarning");
	}

	-(void) BtnCancel_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.SaveLocationVC, JD.iPhone", "BtnCancel_TouchUpInside");
	}

	-(void) BtnBack_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.SaveLocationVC, JD.iPhone", "BtnBack_TouchUpInside");
	}
@end

@interface JD_iPhone_LoadingOverlay : UIView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation JD_iPhone_LoadingOverlay { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface CreateAccountJobVC : BaseVC {
}
	@property (nonatomic, assign) UIButton * btnNext;
	@property (nonatomic, assign) UIButton * btnSelectJob;
	@property (nonatomic, assign) UIButton * btnSelectRole;
	-(UIButton *) btnNext;
	-(void) setBtnNext:(UIButton *)p0;
	-(UIButton *) btnSelectJob;
	-(void) setBtnSelectJob:(UIButton *)p0;
	-(UIButton *) btnSelectRole;
	-(void) setBtnSelectRole:(UIButton *)p0;
	-(void) viewDidLoad;
	-(void) viewDidLayoutSubviews;
	-(void) viewWillAppear:(BOOL)p0;
@end
@implementation CreateAccountJobVC { } 

	-(UIButton *) btnNext
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CreateAccountJobVC, JD.iPhone", "get_btnNext");
	}

	-(void) setBtnNext:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CreateAccountJobVC, JD.iPhone", "set_btnNext");
	}

	-(UIButton *) btnSelectJob
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CreateAccountJobVC, JD.iPhone", "get_btnSelectJob");
	}

	-(void) setBtnSelectJob:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CreateAccountJobVC, JD.iPhone", "set_btnSelectJob");
	}

	-(UIButton *) btnSelectRole
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.CreateAccountJobVC, JD.iPhone", "get_btnSelectRole");
	}

	-(void) setBtnSelectRole:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.CreateAccountJobVC, JD.iPhone", "set_btnSelectRole");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.CreateAccountJobVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) viewDidLayoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.CreateAccountJobVC, JD.iPhone", "ViewDidLayoutSubviews");
	}

	-(void) viewWillAppear:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_31 (self, _cmd, &managed_method, p0, "System.Boolean, mscorlib", "JD.iPhone.CreateAccountJobVC, JD.iPhone", "ViewWillAppear");
	}
@end

@interface JD_iPhone_ConfirmCategorySource : NSObject<UICollectionViewSource> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) collectionView:(UICollectionView *)p0 numberOfItemsInSection:(NSInteger)p1;
	-(UICollectionViewCell *) collectionView:(UICollectionView *)p0 cellForItemAtIndexPath:(NSIndexPath *)p1;
	-(void) collectionView:(UICollectionView *)p0 didSelectItemAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation JD_iPhone_ConfirmCategorySource { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(NSInteger) collectionView:(UICollectionView *)p0 numberOfItemsInSection:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_35 (self, _cmd, &managed_method, p0, p1, "UIKit.UICollectionView, Xamarin.iOS", "System.nint, Xamarin.iOS", "JD.iPhone.ConfirmCategorySource, JD.iPhone", "GetItemsCount");
	}

	-(UICollectionViewCell *) collectionView:(UICollectionView *)p0 cellForItemAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_36 (self, _cmd, &managed_method, p0, p1, "UIKit.UICollectionView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.ConfirmCategorySource, JD.iPhone", "GetCell");
	}

	-(void) collectionView:(UICollectionView *)p0 didSelectItemAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_37 (self, _cmd, &managed_method, p0, p1, "UIKit.UICollectionView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.ConfirmCategorySource, JD.iPhone", "ItemSelected");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface JD_iPhone_ConfirmTableSource : NSObject<UIScrollViewDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end
@implementation JD_iPhone_ConfirmTableSource { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_22 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.ConfirmTableSource, JD.iPhone", "GetCell");
	}

	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "System.nint, Xamarin.iOS", "JD.iPhone.ConfirmTableSource, JD.iPhone", "RowsInSection");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_8 (self, _cmd, &managed_method, "JD.iPhone.ConfirmTableSource, JD.iPhone", ".ctor", &call_super);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface ConfirmInfoVC : BaseVC {
}
	@property (nonatomic, assign) UIButton * btnBack;
	@property (nonatomic, assign) UIButton * btnCategoryEdit;
	@property (nonatomic, assign) UIButton * btnChangeProfile;
	@property (nonatomic, assign) UIButton * btnConfirm;
	@property (nonatomic, assign) UIButton * btnInfoEdit;
	@property (nonatomic, assign) UICollectionView * collectionView;
	@property (nonatomic, assign) UIImageView * imgPhoto;
	@property (nonatomic, assign) UITableView * table;
	-(UIButton *) btnBack;
	-(void) setBtnBack:(UIButton *)p0;
	-(UIButton *) btnCategoryEdit;
	-(void) setBtnCategoryEdit:(UIButton *)p0;
	-(UIButton *) btnChangeProfile;
	-(void) setBtnChangeProfile:(UIButton *)p0;
	-(UIButton *) btnConfirm;
	-(void) setBtnConfirm:(UIButton *)p0;
	-(UIButton *) btnInfoEdit;
	-(void) setBtnInfoEdit:(UIButton *)p0;
	-(UICollectionView *) collectionView;
	-(void) setCollectionView:(UICollectionView *)p0;
	-(UIImageView *) imgPhoto;
	-(void) setImgPhoto:(UIImageView *)p0;
	-(UITableView *) table;
	-(void) setTable:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidLayoutSubviews;
	-(void) BtnBack_TouchUpInside:(UIButton *)p0;
	-(void) BtnConfirm_TouchUpInside:(UIButton *)p0;
	-(void) BtnChangeProfile_TouchUpInside:(UIButton *)p0;
	-(void) BtnInfoEdit_TouchUpInside:(UIButton *)p0;
	-(void) BtnCategoryEdit_TouchUpInside:(UIButton *)p0;
@end
@implementation ConfirmInfoVC { } 

	-(UIButton *) btnBack
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.ConfirmInfoVC, JD.iPhone", "get_btnBack");
	}

	-(void) setBtnBack:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.ConfirmInfoVC, JD.iPhone", "set_btnBack");
	}

	-(UIButton *) btnCategoryEdit
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.ConfirmInfoVC, JD.iPhone", "get_btnCategoryEdit");
	}

	-(void) setBtnCategoryEdit:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.ConfirmInfoVC, JD.iPhone", "set_btnCategoryEdit");
	}

	-(UIButton *) btnChangeProfile
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.ConfirmInfoVC, JD.iPhone", "get_btnChangeProfile");
	}

	-(void) setBtnChangeProfile:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.ConfirmInfoVC, JD.iPhone", "set_btnChangeProfile");
	}

	-(UIButton *) btnConfirm
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.ConfirmInfoVC, JD.iPhone", "get_btnConfirm");
	}

	-(void) setBtnConfirm:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.ConfirmInfoVC, JD.iPhone", "set_btnConfirm");
	}

	-(UIButton *) btnInfoEdit
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.ConfirmInfoVC, JD.iPhone", "get_btnInfoEdit");
	}

	-(void) setBtnInfoEdit:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.ConfirmInfoVC, JD.iPhone", "set_btnInfoEdit");
	}

	-(UICollectionView *) collectionView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_38 (self, _cmd, &managed_method, "JD.iPhone.ConfirmInfoVC, JD.iPhone", "get_collectionView");
	}

	-(void) setCollectionView:(UICollectionView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_39 (self, _cmd, &managed_method, p0, "UIKit.UICollectionView, Xamarin.iOS", "JD.iPhone.ConfirmInfoVC, JD.iPhone", "set_collectionView");
	}

	-(UIImageView *) imgPhoto
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_24 (self, _cmd, &managed_method, "JD.iPhone.ConfirmInfoVC, JD.iPhone", "get_imgPhoto");
	}

	-(void) setImgPhoto:(UIImageView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_25 (self, _cmd, &managed_method, p0, "UIKit.UIImageView, Xamarin.iOS", "JD.iPhone.ConfirmInfoVC, JD.iPhone", "set_imgPhoto");
	}

	-(UITableView *) table
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_17 (self, _cmd, &managed_method, "JD.iPhone.ConfirmInfoVC, JD.iPhone", "get_table");
	}

	-(void) setTable:(UITableView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_18 (self, _cmd, &managed_method, p0, "UIKit.UITableView, Xamarin.iOS", "JD.iPhone.ConfirmInfoVC, JD.iPhone", "set_table");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.ConfirmInfoVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) viewDidLayoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.ConfirmInfoVC, JD.iPhone", "ViewDidLayoutSubviews");
	}

	-(void) BtnBack_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.ConfirmInfoVC, JD.iPhone", "BtnBack_TouchUpInside");
	}

	-(void) BtnConfirm_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.ConfirmInfoVC, JD.iPhone", "BtnConfirm_TouchUpInside");
	}

	-(void) BtnChangeProfile_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.ConfirmInfoVC, JD.iPhone", "BtnChangeProfile_TouchUpInside");
	}

	-(void) BtnInfoEdit_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.ConfirmInfoVC, JD.iPhone", "BtnInfoEdit_TouchUpInside");
	}

	-(void) BtnCategoryEdit_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.ConfirmInfoVC, JD.iPhone", "BtnCategoryEdit_TouchUpInside");
	}
@end

@interface JD_iPhone_CategoryCollectionSource : NSObject<UICollectionViewSource> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) collectionView:(UICollectionView *)p0 numberOfItemsInSection:(NSInteger)p1;
	-(UICollectionViewCell *) collectionView:(UICollectionView *)p0 cellForItemAtIndexPath:(NSIndexPath *)p1;
	-(void) collectionView:(UICollectionView *)p0 didSelectItemAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation JD_iPhone_CategoryCollectionSource { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(NSInteger) collectionView:(UICollectionView *)p0 numberOfItemsInSection:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_35 (self, _cmd, &managed_method, p0, p1, "UIKit.UICollectionView, Xamarin.iOS", "System.nint, Xamarin.iOS", "JD.iPhone.CategoryCollectionSource, JD.iPhone", "GetItemsCount");
	}

	-(UICollectionViewCell *) collectionView:(UICollectionView *)p0 cellForItemAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_36 (self, _cmd, &managed_method, p0, p1, "UIKit.UICollectionView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.CategoryCollectionSource, JD.iPhone", "GetCell");
	}

	-(void) collectionView:(UICollectionView *)p0 didSelectItemAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_37 (self, _cmd, &managed_method, p0, p1, "UIKit.UICollectionView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "JD.iPhone.CategoryCollectionSource, JD.iPhone", "ItemSelected");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface SelectCategoryVC : BaseVC {
}
	@property (nonatomic, assign) UIButton * btnBack;
	@property (nonatomic, assign) UIButton * btnNext;
	@property (nonatomic, assign) UICollectionView * collectionView;
	-(UIButton *) btnBack;
	-(void) setBtnBack:(UIButton *)p0;
	-(UIButton *) btnNext;
	-(void) setBtnNext:(UIButton *)p0;
	-(UICollectionView *) collectionView;
	-(void) setCollectionView:(UICollectionView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidLayoutSubviews;
	-(void) BtnBack_TouchUpInside:(UIButton *)p0;
	-(void) BtnNext_TouchUpInside:(UIButton *)p0;
@end
@implementation SelectCategoryVC { } 

	-(UIButton *) btnBack
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.SelectCategoryVC, JD.iPhone", "get_btnBack");
	}

	-(void) setBtnBack:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.SelectCategoryVC, JD.iPhone", "set_btnBack");
	}

	-(UIButton *) btnNext
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.SelectCategoryVC, JD.iPhone", "get_btnNext");
	}

	-(void) setBtnNext:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.SelectCategoryVC, JD.iPhone", "set_btnNext");
	}

	-(UICollectionView *) collectionView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_38 (self, _cmd, &managed_method, "JD.iPhone.SelectCategoryVC, JD.iPhone", "get_collectionView");
	}

	-(void) setCollectionView:(UICollectionView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_39 (self, _cmd, &managed_method, p0, "UIKit.UICollectionView, Xamarin.iOS", "JD.iPhone.SelectCategoryVC, JD.iPhone", "set_collectionView");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.SelectCategoryVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) viewDidLayoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.SelectCategoryVC, JD.iPhone", "ViewDidLayoutSubviews");
	}

	-(void) BtnBack_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.SelectCategoryVC, JD.iPhone", "BtnBack_TouchUpInside");
	}

	-(void) BtnNext_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.SelectCategoryVC, JD.iPhone", "BtnNext_TouchUpInside");
	}
@end

@interface JD_API_Job : NSObject {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end
@implementation JD_API_Job { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_8 (self, _cmd, &managed_method, "JD.API.Job, JD.iPhone", ".ctor", &call_super);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface JD_iPhone_OutputRecorder : NSObject<AVCaptureVideoDataOutputSampleBufferDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) captureOutput:(AVCaptureOutput *)p0 didOutputSampleBuffer:(id)p1 fromConnection:(AVCaptureConnection *)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end
@implementation JD_iPhone_OutputRecorder { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) captureOutput:(AVCaptureOutput *)p0 didOutputSampleBuffer:(id)p1 fromConnection:(AVCaptureConnection *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_40 (self, _cmd, &managed_method, p0, p1, p2, "AVFoundation.AVCaptureOutput, Xamarin.iOS", "CoreMedia.CMSampleBuffer, Xamarin.iOS", "AVFoundation.AVCaptureConnection, Xamarin.iOS", "JD.iPhone.OutputRecorder, JD.iPhone", "DidOutputSampleBuffer");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_8 (self, _cmd, &managed_method, "JD.iPhone.OutputRecorder, JD.iPhone", ".ctor", &call_super);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface SelectJobVC : BaseVC {
}
	@property (nonatomic, assign) UIButton * btnBack;
	@property (nonatomic, assign) UIButton * btnNext;
	@property (nonatomic, assign) UIView * navBarView;
	@property (nonatomic, assign) UISearchBar * searchBar;
	@property (nonatomic, assign) UITableView * table;
	-(UIButton *) btnBack;
	-(void) setBtnBack:(UIButton *)p0;
	-(UIButton *) btnNext;
	-(void) setBtnNext:(UIButton *)p0;
	-(UIView *) navBarView;
	-(void) setNavBarView:(UIView *)p0;
	-(UISearchBar *) searchBar;
	-(void) setSearchBar:(UISearchBar *)p0;
	-(UITableView *) table;
	-(void) setTable:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidLayoutSubviews;
	-(void) BtnBack_TouchUpInside:(UIButton *)p0;
	-(void) BtnNext_TouchUpInside:(UIButton *)p0;
@end
@implementation SelectJobVC { } 

	-(UIButton *) btnBack
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.SelectJobVC, JD.iPhone", "get_btnBack");
	}

	-(void) setBtnBack:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.SelectJobVC, JD.iPhone", "set_btnBack");
	}

	-(UIButton *) btnNext
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.SelectJobVC, JD.iPhone", "get_btnNext");
	}

	-(void) setBtnNext:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.SelectJobVC, JD.iPhone", "set_btnNext");
	}

	-(UIView *) navBarView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.SelectJobVC, JD.iPhone", "get_navBarView");
	}

	-(void) setNavBarView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.SelectJobVC, JD.iPhone", "set_navBarView");
	}

	-(UISearchBar *) searchBar
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_29 (self, _cmd, &managed_method, "JD.iPhone.SelectJobVC, JD.iPhone", "get_searchBar");
	}

	-(void) setSearchBar:(UISearchBar *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_30 (self, _cmd, &managed_method, p0, "UIKit.UISearchBar, Xamarin.iOS", "JD.iPhone.SelectJobVC, JD.iPhone", "set_searchBar");
	}

	-(UITableView *) table
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_17 (self, _cmd, &managed_method, "JD.iPhone.SelectJobVC, JD.iPhone", "get_table");
	}

	-(void) setTable:(UITableView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_18 (self, _cmd, &managed_method, p0, "UIKit.UITableView, Xamarin.iOS", "JD.iPhone.SelectJobVC, JD.iPhone", "set_table");
	}

	-(void) viewDidLoad
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.SelectJobVC, JD.iPhone", "ViewDidLoad");
	}

	-(void) viewDidLayoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "JD.iPhone.SelectJobVC, JD.iPhone", "ViewDidLayoutSubviews");
	}

	-(void) BtnBack_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.SelectJobVC, JD.iPhone", "BtnBack_TouchUpInside");
	}

	-(void) BtnNext_TouchUpInside:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.SelectJobVC, JD.iPhone", "BtnNext_TouchUpInside");
	}
@end

@interface JD_iPhone_DocumentCell_ImageScrollDelegate : NSObject<UIScrollViewDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) scrollViewDidEndDecelerating:(UIScrollView *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation JD_iPhone_DocumentCell_ImageScrollDelegate { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) scrollViewDidEndDecelerating:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_27 (self, _cmd, &managed_method, p0, "UIKit.UIScrollView, Xamarin.iOS", "JD.iPhone.DocumentCell+ImageScrollDelegate, JD.iPhone", "DecelerationEnded");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface DocumentCell : UITableViewCell {
	XamarinObject __monoObjectGCHandle;
}
	@property (nonatomic, assign) UIButton * btnSave;
	@property (nonatomic, assign) UILabel * expiryDate;
	@property (nonatomic, assign) UILabel * fileName;
	@property (nonatomic, assign) UILabel * issuedDate;
	@property (nonatomic, assign) UILabel * notes;
	@property (nonatomic, assign) UIPageControl * pageControl;
	@property (nonatomic, assign) UILabel * saveLocation;
	@property (nonatomic, assign) UIView * saveLocationView;
	@property (nonatomic, assign) UIScrollView * scrollView;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIButton *) btnSave;
	-(void) setBtnSave:(UIButton *)p0;
	-(UILabel *) expiryDate;
	-(void) setExpiryDate:(UILabel *)p0;
	-(UILabel *) fileName;
	-(void) setFileName:(UILabel *)p0;
	-(UILabel *) issuedDate;
	-(void) setIssuedDate:(UILabel *)p0;
	-(UILabel *) notes;
	-(void) setNotes:(UILabel *)p0;
	-(UIPageControl *) pageControl;
	-(void) setPageControl:(UIPageControl *)p0;
	-(UILabel *) saveLocation;
	-(void) setSaveLocation:(UILabel *)p0;
	-(UIView *) saveLocationView;
	-(void) setSaveLocationView:(UIView *)p0;
	-(UIScrollView *) scrollView;
	-(void) setScrollView:(UIScrollView *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation DocumentCell { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(UIButton *) btnSave
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, "JD.iPhone.DocumentCell, JD.iPhone", "get_btnSave");
	}

	-(void) setBtnSave:(UIButton *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, "UIKit.UIButton, Xamarin.iOS", "JD.iPhone.DocumentCell, JD.iPhone", "set_btnSave");
	}

	-(UILabel *) expiryDate
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.DocumentCell, JD.iPhone", "get_expiryDate");
	}

	-(void) setExpiryDate:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.DocumentCell, JD.iPhone", "set_expiryDate");
	}

	-(UILabel *) fileName
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.DocumentCell, JD.iPhone", "get_fileName");
	}

	-(void) setFileName:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.DocumentCell, JD.iPhone", "set_fileName");
	}

	-(UILabel *) issuedDate
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.DocumentCell, JD.iPhone", "get_issuedDate");
	}

	-(void) setIssuedDate:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.DocumentCell, JD.iPhone", "set_issuedDate");
	}

	-(UILabel *) notes
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.DocumentCell, JD.iPhone", "get_notes");
	}

	-(void) setNotes:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.DocumentCell, JD.iPhone", "set_notes");
	}

	-(UIPageControl *) pageControl
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_32 (self, _cmd, &managed_method, "JD.iPhone.DocumentCell, JD.iPhone", "get_pageControl");
	}

	-(void) setPageControl:(UIPageControl *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_33 (self, _cmd, &managed_method, p0, "UIKit.UIPageControl, Xamarin.iOS", "JD.iPhone.DocumentCell, JD.iPhone", "set_pageControl");
	}

	-(UILabel *) saveLocation
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, "JD.iPhone.DocumentCell, JD.iPhone", "get_saveLocation");
	}

	-(void) setSaveLocation:(UILabel *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, "UIKit.UILabel, Xamarin.iOS", "JD.iPhone.DocumentCell, JD.iPhone", "set_saveLocation");
	}

	-(UIView *) saveLocationView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, "JD.iPhone.DocumentCell, JD.iPhone", "get_saveLocationView");
	}

	-(void) setSaveLocationView:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, "UIKit.UIView, Xamarin.iOS", "JD.iPhone.DocumentCell, JD.iPhone", "set_saveLocationView");
	}

	-(UIScrollView *) scrollView
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_26 (self, _cmd, &managed_method, "JD.iPhone.DocumentCell, JD.iPhone", "get_scrollView");
	}

	-(void) setScrollView:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_27 (self, _cmd, &managed_method, p0, "UIKit.UIScrollView, Xamarin.iOS", "JD.iPhone.DocumentCell, JD.iPhone", "set_scrollView");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface UIKit_UIAlertView__UIAlertViewDelegate : NSObject<UIAlertViewDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) alertViewCancel:(UIAlertView *)p0;
	-(void) alertView:(UIAlertView *)p0 clickedButtonAtIndex:(NSInteger)p1;
	-(void) alertView:(UIAlertView *)p0 didDismissWithButtonIndex:(NSInteger)p1;
	-(void) didPresentAlertView:(UIAlertView *)p0;
	-(BOOL) alertViewShouldEnableFirstOtherButton:(UIAlertView *)p0;
	-(void) alertView:(UIAlertView *)p0 willDismissWithButtonIndex:(NSInteger)p1;
	-(void) willPresentAlertView:(UIAlertView *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation UIKit_UIAlertView__UIAlertViewDelegate { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) alertViewCancel:(UIAlertView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_41 (self, _cmd, &managed_method, p0, "UIKit.UIAlertView, Xamarin.iOS", "UIKit.UIAlertView+_UIAlertViewDelegate, Xamarin.iOS", "Canceled");
	}

	-(void) alertView:(UIAlertView *)p0 clickedButtonAtIndex:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_42 (self, _cmd, &managed_method, p0, p1, "UIKit.UIAlertView, Xamarin.iOS", "System.nint, Xamarin.iOS", "UIKit.UIAlertView+_UIAlertViewDelegate, Xamarin.iOS", "Clicked");
	}

	-(void) alertView:(UIAlertView *)p0 didDismissWithButtonIndex:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_42 (self, _cmd, &managed_method, p0, p1, "UIKit.UIAlertView, Xamarin.iOS", "System.nint, Xamarin.iOS", "UIKit.UIAlertView+_UIAlertViewDelegate, Xamarin.iOS", "Dismissed");
	}

	-(void) didPresentAlertView:(UIAlertView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_41 (self, _cmd, &managed_method, p0, "UIKit.UIAlertView, Xamarin.iOS", "UIKit.UIAlertView+_UIAlertViewDelegate, Xamarin.iOS", "Presented");
	}

	-(BOOL) alertViewShouldEnableFirstOtherButton:(UIAlertView *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_43 (self, _cmd, &managed_method, p0, "UIKit.UIAlertView, Xamarin.iOS", "UIKit.UIAlertView+_UIAlertViewDelegate, Xamarin.iOS", "ShouldEnableFirstOtherButton");
	}

	-(void) alertView:(UIAlertView *)p0 willDismissWithButtonIndex:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_42 (self, _cmd, &managed_method, p0, p1, "UIKit.UIAlertView, Xamarin.iOS", "System.nint, Xamarin.iOS", "UIKit.UIAlertView+_UIAlertViewDelegate, Xamarin.iOS", "WillDismiss");
	}

	-(void) willPresentAlertView:(UIAlertView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_41 (self, _cmd, &managed_method, p0, "UIKit.UIAlertView, Xamarin.iOS", "UIKit.UIAlertView+_UIAlertViewDelegate, Xamarin.iOS", "WillPresent");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface UIKit_UIBarButtonItem_Callback : NSObject {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) InvokeAction:(NSObject *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end
@implementation UIKit_UIBarButtonItem_Callback { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) InvokeAction:(NSObject *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_44 (self, _cmd, &managed_method, p0, "Foundation.NSObject, Xamarin.iOS", "UIKit.UIBarButtonItem+Callback, Xamarin.iOS", "Call");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_8 (self, _cmd, &managed_method, "UIKit.UIBarButtonItem+Callback, Xamarin.iOS", ".ctor", &call_super);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface __UIGestureRecognizerToken : NSObject {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end
@implementation __UIGestureRecognizerToken { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_8 (self, _cmd, &managed_method, "UIKit.UIGestureRecognizer+Token, Xamarin.iOS", ".ctor", &call_super);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface __UIGestureRecognizerParameterlessToken : __UIGestureRecognizerToken {
}
	-(void) target;
@end
@implementation __UIGestureRecognizerParameterlessToken { } 

	-(void) target
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, "UIKit.UIGestureRecognizer+ParameterlessDispatch, Xamarin.iOS", "Activated");
	}
@end

@interface __UIGestureRecognizerParametrizedToken : __UIGestureRecognizerToken {
}
	-(void) target:(UIGestureRecognizer *)p0;
@end
@implementation __UIGestureRecognizerParametrizedToken { } 

	-(void) target:(UIGestureRecognizer *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_45 (self, _cmd, &managed_method, p0, "UIKit.UIGestureRecognizer, Xamarin.iOS", "UIKit.UIGestureRecognizer+ParametrizedDispatch, Xamarin.iOS", "Activated");
	}
@end

@interface __UITapGestureRecognizer : __UIGestureRecognizerToken {
}
	-(void) target:(UITapGestureRecognizer *)p0;
@end
@implementation __UITapGestureRecognizer { } 

	-(void) target:(UITapGestureRecognizer *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_46 (self, _cmd, &managed_method, p0, "UIKit.UITapGestureRecognizer, Xamarin.iOS", "UIKit.UITapGestureRecognizer+Callback, Xamarin.iOS", "Activated");
	}
@end

@interface UIKit_UIImagePickerController__UIImagePickerControllerDelegate : NSObject<UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) imagePickerControllerDidCancel:(UIImagePickerController *)p0;
	-(void) imagePickerController:(UIImagePickerController *)p0 didFinishPickingImage:(UIImage *)p1 editingInfo:(NSDictionary *)p2;
	-(void) imagePickerController:(UIImagePickerController *)p0 didFinishPickingMediaWithInfo:(NSDictionary *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end
@implementation UIKit_UIImagePickerController__UIImagePickerControllerDelegate { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) imagePickerControllerDidCancel:(UIImagePickerController *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_47 (self, _cmd, &managed_method, p0, "UIKit.UIImagePickerController, Xamarin.iOS", "UIKit.UIImagePickerController+_UIImagePickerControllerDelegate, Xamarin.iOS", "Canceled");
	}

	-(void) imagePickerController:(UIImagePickerController *)p0 didFinishPickingImage:(UIImage *)p1 editingInfo:(NSDictionary *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_48 (self, _cmd, &managed_method, p0, p1, p2, "UIKit.UIImagePickerController, Xamarin.iOS", "UIKit.UIImage, Xamarin.iOS", "Foundation.NSDictionary, Xamarin.iOS", "UIKit.UIImagePickerController+_UIImagePickerControllerDelegate, Xamarin.iOS", "FinishedPickingImage");
	}

	-(void) imagePickerController:(UIImagePickerController *)p0 didFinishPickingMediaWithInfo:(NSDictionary *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_49 (self, _cmd, &managed_method, p0, p1, "UIKit.UIImagePickerController, Xamarin.iOS", "Foundation.NSDictionary, Xamarin.iOS", "UIKit.UIImagePickerController+_UIImagePickerControllerDelegate, Xamarin.iOS", "FinishedPickingMedia");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_8 (self, _cmd, &managed_method, "UIKit.UIImagePickerController+_UIImagePickerControllerDelegate, Xamarin.iOS", ".ctor", &call_super);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface UIKit_UITextField__UITextFieldDelegate : NSObject<UITextFieldDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) textFieldDidEndEditing:(UITextField *)p0;
	-(void) textFieldDidBeginEditing:(UITextField *)p0;
	-(BOOL) textFieldShouldBeginEditing:(UITextField *)p0;
	-(BOOL) textField:(UITextField *)p0 shouldChangeCharactersInRange:(NSRange)p1 replacementString:(NSString *)p2;
	-(BOOL) textFieldShouldClear:(UITextField *)p0;
	-(BOOL) textFieldShouldEndEditing:(UITextField *)p0;
	-(BOOL) textFieldShouldReturn:(UITextField *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end
@implementation UIKit_UITextField__UITextFieldDelegate { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) textFieldDidEndEditing:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_20 (self, _cmd, &managed_method, p0, "UIKit.UITextField, Xamarin.iOS", "UIKit.UITextField+_UITextFieldDelegate, Xamarin.iOS", "EditingEnded");
	}

	-(void) textFieldDidBeginEditing:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_20 (self, _cmd, &managed_method, p0, "UIKit.UITextField, Xamarin.iOS", "UIKit.UITextField+_UITextFieldDelegate, Xamarin.iOS", "EditingStarted");
	}

	-(BOOL) textFieldShouldBeginEditing:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_50 (self, _cmd, &managed_method, p0, "UIKit.UITextField, Xamarin.iOS", "UIKit.UITextField+_UITextFieldDelegate, Xamarin.iOS", "ShouldBeginEditing");
	}

	-(BOOL) textField:(UITextField *)p0 shouldChangeCharactersInRange:(NSRange)p1 replacementString:(NSString *)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_51 (self, _cmd, &managed_method, p0, p1, p2, "UIKit.UITextField, Xamarin.iOS", "Foundation.NSRange, Xamarin.iOS", "System.String, mscorlib", "UIKit.UITextField+_UITextFieldDelegate, Xamarin.iOS", "ShouldChangeCharacters");
	}

	-(BOOL) textFieldShouldClear:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_50 (self, _cmd, &managed_method, p0, "UIKit.UITextField, Xamarin.iOS", "UIKit.UITextField+_UITextFieldDelegate, Xamarin.iOS", "ShouldClear");
	}

	-(BOOL) textFieldShouldEndEditing:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_50 (self, _cmd, &managed_method, p0, "UIKit.UITextField, Xamarin.iOS", "UIKit.UITextField+_UITextFieldDelegate, Xamarin.iOS", "ShouldEndEditing");
	}

	-(BOOL) textFieldShouldReturn:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_50 (self, _cmd, &managed_method, p0, "UIKit.UITextField, Xamarin.iOS", "UIKit.UITextField+_UITextFieldDelegate, Xamarin.iOS", "ShouldReturn");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_8 (self, _cmd, &managed_method, "UIKit.UITextField+_UITextFieldDelegate, Xamarin.iOS", ".ctor", &call_super);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface UIKit_UIView_UIViewAppearance : NSObject {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) setBackgroundColor:(UIColor *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation UIKit_UIView_UIViewAppearance { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) setBackgroundColor:(UIColor *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_52 (self, _cmd, &managed_method, p0, "UIKit.UIColor, Xamarin.iOS", "UIKit.UIView+UIViewAppearance, Xamarin.iOS", "set_BackgroundColor");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface UIKit_UISearchBar__UISearchBarDelegate : NSObject<UISearchBarDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) searchBarBookmarkButtonClicked:(UISearchBar *)p0;
	-(void) searchBarCancelButtonClicked:(UISearchBar *)p0;
	-(void) searchBarResultsListButtonClicked:(UISearchBar *)p0;
	-(void) searchBarTextDidBeginEditing:(UISearchBar *)p0;
	-(void) searchBarTextDidEndEditing:(UISearchBar *)p0;
	-(void) searchBarSearchButtonClicked:(UISearchBar *)p0;
	-(void) searchBar:(UISearchBar *)p0 selectedScopeButtonIndexDidChange:(NSInteger)p1;
	-(BOOL) searchBarShouldBeginEditing:(UISearchBar *)p0;
	-(BOOL) searchBar:(UISearchBar *)p0 shouldChangeTextInRange:(NSRange)p1 replacementText:(NSString *)p2;
	-(BOOL) searchBarShouldEndEditing:(UISearchBar *)p0;
	-(void) searchBar:(UISearchBar *)p0 textDidChange:(NSString *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end
@implementation UIKit_UISearchBar__UISearchBarDelegate { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) searchBarBookmarkButtonClicked:(UISearchBar *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_30 (self, _cmd, &managed_method, p0, "UIKit.UISearchBar, Xamarin.iOS", "UIKit.UISearchBar+_UISearchBarDelegate, Xamarin.iOS", "BookmarkButtonClicked");
	}

	-(void) searchBarCancelButtonClicked:(UISearchBar *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_30 (self, _cmd, &managed_method, p0, "UIKit.UISearchBar, Xamarin.iOS", "UIKit.UISearchBar+_UISearchBarDelegate, Xamarin.iOS", "CancelButtonClicked");
	}

	-(void) searchBarResultsListButtonClicked:(UISearchBar *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_30 (self, _cmd, &managed_method, p0, "UIKit.UISearchBar, Xamarin.iOS", "UIKit.UISearchBar+_UISearchBarDelegate, Xamarin.iOS", "ListButtonClicked");
	}

	-(void) searchBarTextDidBeginEditing:(UISearchBar *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_30 (self, _cmd, &managed_method, p0, "UIKit.UISearchBar, Xamarin.iOS", "UIKit.UISearchBar+_UISearchBarDelegate, Xamarin.iOS", "OnEditingStarted");
	}

	-(void) searchBarTextDidEndEditing:(UISearchBar *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_30 (self, _cmd, &managed_method, p0, "UIKit.UISearchBar, Xamarin.iOS", "UIKit.UISearchBar+_UISearchBarDelegate, Xamarin.iOS", "OnEditingStopped");
	}

	-(void) searchBarSearchButtonClicked:(UISearchBar *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_30 (self, _cmd, &managed_method, p0, "UIKit.UISearchBar, Xamarin.iOS", "UIKit.UISearchBar+_UISearchBarDelegate, Xamarin.iOS", "SearchButtonClicked");
	}

	-(void) searchBar:(UISearchBar *)p0 selectedScopeButtonIndexDidChange:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_53 (self, _cmd, &managed_method, p0, p1, "UIKit.UISearchBar, Xamarin.iOS", "System.nint, Xamarin.iOS", "UIKit.UISearchBar+_UISearchBarDelegate, Xamarin.iOS", "SelectedScopeButtonIndexChanged");
	}

	-(BOOL) searchBarShouldBeginEditing:(UISearchBar *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_54 (self, _cmd, &managed_method, p0, "UIKit.UISearchBar, Xamarin.iOS", "UIKit.UISearchBar+_UISearchBarDelegate, Xamarin.iOS", "ShouldBeginEditing");
	}

	-(BOOL) searchBar:(UISearchBar *)p0 shouldChangeTextInRange:(NSRange)p1 replacementText:(NSString *)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_55 (self, _cmd, &managed_method, p0, p1, p2, "UIKit.UISearchBar, Xamarin.iOS", "Foundation.NSRange, Xamarin.iOS", "System.String, mscorlib", "UIKit.UISearchBar+_UISearchBarDelegate, Xamarin.iOS", "ShouldChangeTextInRange");
	}

	-(BOOL) searchBarShouldEndEditing:(UISearchBar *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_54 (self, _cmd, &managed_method, p0, "UIKit.UISearchBar, Xamarin.iOS", "UIKit.UISearchBar+_UISearchBarDelegate, Xamarin.iOS", "ShouldEndEditing");
	}

	-(void) searchBar:(UISearchBar *)p0 textDidChange:(NSString *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_56 (self, _cmd, &managed_method, p0, p1, "UIKit.UISearchBar, Xamarin.iOS", "System.String, mscorlib", "UIKit.UISearchBar+_UISearchBarDelegate, Xamarin.iOS", "TextChanged");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_8 (self, _cmd, &managed_method, "UIKit.UISearchBar+_UISearchBarDelegate, Xamarin.iOS", ".ctor", &call_super);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface __NSObject_Disposer : NSObject {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	+(void) drain:(NSObject *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end
@implementation __NSObject_Disposer { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	+(void) drain:(NSObject *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_57 (self, _cmd, &managed_method, p0, "Foundation.NSObject, Xamarin.iOS", "Foundation.NSObject+NSObject_Disposer, Xamarin.iOS", "Drain");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_8 (self, _cmd, &managed_method, "Foundation.NSObject+NSObject_Disposer, Xamarin.iOS", ".ctor", &call_super);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface UIKit_UIScrollView__UIScrollViewDelegate : NSObject<UIScrollViewDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) scrollViewDidEndDecelerating:(UIScrollView *)p0;
	-(void) scrollViewWillBeginDecelerating:(UIScrollView *)p0;
	-(void) scrollViewDidZoom:(UIScrollView *)p0;
	-(void) scrollViewDidEndDragging:(UIScrollView *)p0 willDecelerate:(BOOL)p1;
	-(void) scrollViewWillBeginDragging:(UIScrollView *)p0;
	-(void) scrollViewDidEndScrollingAnimation:(UIScrollView *)p0;
	-(void) scrollViewDidScroll:(UIScrollView *)p0;
	-(void) scrollViewDidScrollToTop:(UIScrollView *)p0;
	-(BOOL) scrollViewShouldScrollToTop:(UIScrollView *)p0;
	-(UIView *) viewForZoomingInScrollView:(UIScrollView *)p0;
	-(void) scrollViewWillEndDragging:(UIScrollView *)p0 withVelocity:(CGPoint)p1 targetContentOffset:(CGPoint*)p2;
	-(void) scrollViewDidEndZooming:(UIScrollView *)p0 withView:(UIView *)p1 atScale:(CGFloat)p2;
	-(void) scrollViewWillBeginZooming:(UIScrollView *)p0 withView:(UIView *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation UIKit_UIScrollView__UIScrollViewDelegate { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) scrollViewDidEndDecelerating:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_27 (self, _cmd, &managed_method, p0, "UIKit.UIScrollView, Xamarin.iOS", "UIKit.UIScrollView+_UIScrollViewDelegate, Xamarin.iOS", "DecelerationEnded");
	}

	-(void) scrollViewWillBeginDecelerating:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_27 (self, _cmd, &managed_method, p0, "UIKit.UIScrollView, Xamarin.iOS", "UIKit.UIScrollView+_UIScrollViewDelegate, Xamarin.iOS", "DecelerationStarted");
	}

	-(void) scrollViewDidZoom:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_27 (self, _cmd, &managed_method, p0, "UIKit.UIScrollView, Xamarin.iOS", "UIKit.UIScrollView+_UIScrollViewDelegate, Xamarin.iOS", "DidZoom");
	}

	-(void) scrollViewDidEndDragging:(UIScrollView *)p0 willDecelerate:(BOOL)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_58 (self, _cmd, &managed_method, p0, p1, "UIKit.UIScrollView, Xamarin.iOS", "System.Boolean, mscorlib", "UIKit.UIScrollView+_UIScrollViewDelegate, Xamarin.iOS", "DraggingEnded");
	}

	-(void) scrollViewWillBeginDragging:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_27 (self, _cmd, &managed_method, p0, "UIKit.UIScrollView, Xamarin.iOS", "UIKit.UIScrollView+_UIScrollViewDelegate, Xamarin.iOS", "DraggingStarted");
	}

	-(void) scrollViewDidEndScrollingAnimation:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_27 (self, _cmd, &managed_method, p0, "UIKit.UIScrollView, Xamarin.iOS", "UIKit.UIScrollView+_UIScrollViewDelegate, Xamarin.iOS", "ScrollAnimationEnded");
	}

	-(void) scrollViewDidScroll:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_27 (self, _cmd, &managed_method, p0, "UIKit.UIScrollView, Xamarin.iOS", "UIKit.UIScrollView+_UIScrollViewDelegate, Xamarin.iOS", "Scrolled");
	}

	-(void) scrollViewDidScrollToTop:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_27 (self, _cmd, &managed_method, p0, "UIKit.UIScrollView, Xamarin.iOS", "UIKit.UIScrollView+_UIScrollViewDelegate, Xamarin.iOS", "ScrolledToTop");
	}

	-(BOOL) scrollViewShouldScrollToTop:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_59 (self, _cmd, &managed_method, p0, "UIKit.UIScrollView, Xamarin.iOS", "UIKit.UIScrollView+_UIScrollViewDelegate, Xamarin.iOS", "ShouldScrollToTop");
	}

	-(UIView *) viewForZoomingInScrollView:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_60 (self, _cmd, &managed_method, p0, "UIKit.UIScrollView, Xamarin.iOS", "UIKit.UIScrollView+_UIScrollViewDelegate, Xamarin.iOS", "ViewForZoomingInScrollView");
	}

	-(void) scrollViewWillEndDragging:(UIScrollView *)p0 withVelocity:(CGPoint)p1 targetContentOffset:(CGPoint*)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_61 (self, _cmd, &managed_method, p0, p1, p2, "UIKit.UIScrollView, Xamarin.iOS", "CoreGraphics.CGPoint, Xamarin.iOS", "CoreGraphics.CGPoint&, Xamarin.iOS", "UIKit.UIScrollView+_UIScrollViewDelegate, Xamarin.iOS", "WillEndDragging");
	}

	-(void) scrollViewDidEndZooming:(UIScrollView *)p0 withView:(UIView *)p1 atScale:(CGFloat)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_62 (self, _cmd, &managed_method, p0, p1, p2, "UIKit.UIScrollView, Xamarin.iOS", "UIKit.UIView, Xamarin.iOS", "System.nfloat, Xamarin.iOS", "UIKit.UIScrollView+_UIScrollViewDelegate, Xamarin.iOS", "ZoomingEnded");
	}

	-(void) scrollViewWillBeginZooming:(UIScrollView *)p0 withView:(UIView *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_63 (self, _cmd, &managed_method, p0, p1, "UIKit.UIScrollView, Xamarin.iOS", "UIKit.UIView, Xamarin.iOS", "UIKit.UIScrollView+_UIScrollViewDelegate, Xamarin.iOS", "ZoomingStarted");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface UIKit_UITabBar_UITabBarAppearance : UIKit_UIView_UIViewAppearance {
}
	-(void) setSelectedImageTintColor:(UIColor *)p0;
@end
@implementation UIKit_UITabBar_UITabBarAppearance { } 

	-(void) setSelectedImageTintColor:(UIColor *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_52 (self, _cmd, &managed_method, p0, "UIKit.UIColor, Xamarin.iOS", "UIKit.UITabBar+UITabBarAppearance, Xamarin.iOS", "set_SelectedImageTintColor");
	}
@end

@interface UIKit_UITabBarController__UITabBarControllerDelegate : NSObject<UITabBarControllerDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) tabBarController:(UITabBarController *)p0 didEndCustomizingViewControllers:(NSArray *)p1 changed:(BOOL)p2;
	-(id) tabBarController:(UITabBarController *)p0 animationControllerForTransitionFromViewController:(UIViewController *)p1 toViewController:(UIViewController *)p2;
	-(id) tabBarController:(UITabBarController *)p0 interactionControllerForAnimationController:(id)p1;
	-(NSInteger) tabBarControllerPreferredInterfaceOrientationForPresentation:(UITabBarController *)p0;
	-(void) tabBarController:(UITabBarController *)p0 willBeginCustomizingViewControllers:(NSArray *)p1;
	-(void) tabBarController:(UITabBarController *)p0 willEndCustomizingViewControllers:(NSArray *)p1 changed:(BOOL)p2;
	-(BOOL) tabBarController:(UITabBarController *)p0 shouldSelectViewController:(UIViewController *)p1;
	-(NSUInteger) tabBarControllerSupportedInterfaceOrientations:(UITabBarController *)p0;
	-(void) tabBarController:(UITabBarController *)p0 didSelectViewController:(UIViewController *)p1;
	-(BOOL) respondsToSelector:(SEL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end
@implementation UIKit_UITabBarController__UITabBarControllerDelegate { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) tabBarController:(UITabBarController *)p0 didEndCustomizingViewControllers:(NSArray *)p1 changed:(BOOL)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_64 (self, _cmd, &managed_method, p0, p1, p2, "UIKit.UITabBarController, Xamarin.iOS", "UIKit.UIViewController[], Xamarin.iOS", "System.Boolean, mscorlib", "UIKit.UITabBarController+_UITabBarControllerDelegate, Xamarin.iOS", "FinishedCustomizingViewControllers");
	}

	-(id) tabBarController:(UITabBarController *)p0 animationControllerForTransitionFromViewController:(UIViewController *)p1 toViewController:(UIViewController *)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_65 (self, _cmd, &managed_method, p0, p1, p2, "UIKit.UITabBarController, Xamarin.iOS", "UIKit.UIViewController, Xamarin.iOS", "UIKit.UIViewController, Xamarin.iOS", "UIKit.UITabBarController+_UITabBarControllerDelegate, Xamarin.iOS", "GetAnimationControllerForTransition");
	}

	-(id) tabBarController:(UITabBarController *)p0 interactionControllerForAnimationController:(id)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_66 (self, _cmd, &managed_method, p0, p1, "UIKit.UITabBarController, Xamarin.iOS", "UIKit.IUIViewControllerAnimatedTransitioning, Xamarin.iOS", "UIKit.UITabBarController+_UITabBarControllerDelegate, Xamarin.iOS", "GetInteractionControllerForAnimationController");
	}

	-(NSInteger) tabBarControllerPreferredInterfaceOrientationForPresentation:(UITabBarController *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_67 (self, _cmd, &managed_method, p0, "UIKit.UITabBarController, Xamarin.iOS", "UIKit.UITabBarController+_UITabBarControllerDelegate, Xamarin.iOS", "GetPreferredInterfaceOrientation");
	}

	-(void) tabBarController:(UITabBarController *)p0 willBeginCustomizingViewControllers:(NSArray *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_68 (self, _cmd, &managed_method, p0, p1, "UIKit.UITabBarController, Xamarin.iOS", "UIKit.UIViewController[], Xamarin.iOS", "UIKit.UITabBarController+_UITabBarControllerDelegate, Xamarin.iOS", "OnCustomizingViewControllers");
	}

	-(void) tabBarController:(UITabBarController *)p0 willEndCustomizingViewControllers:(NSArray *)p1 changed:(BOOL)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_64 (self, _cmd, &managed_method, p0, p1, p2, "UIKit.UITabBarController, Xamarin.iOS", "UIKit.UIViewController[], Xamarin.iOS", "System.Boolean, mscorlib", "UIKit.UITabBarController+_UITabBarControllerDelegate, Xamarin.iOS", "OnEndCustomizingViewControllers");
	}

	-(BOOL) tabBarController:(UITabBarController *)p0 shouldSelectViewController:(UIViewController *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_69 (self, _cmd, &managed_method, p0, p1, "UIKit.UITabBarController, Xamarin.iOS", "UIKit.UIViewController, Xamarin.iOS", "UIKit.UITabBarController+_UITabBarControllerDelegate, Xamarin.iOS", "ShouldSelectViewController");
	}

	-(NSUInteger) tabBarControllerSupportedInterfaceOrientations:(UITabBarController *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_70 (self, _cmd, &managed_method, p0, "UIKit.UITabBarController, Xamarin.iOS", "UIKit.UITabBarController+_UITabBarControllerDelegate, Xamarin.iOS", "SupportedInterfaceOrientations");
	}

	-(void) tabBarController:(UITabBarController *)p0 didSelectViewController:(UIViewController *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_71 (self, _cmd, &managed_method, p0, p1, "UIKit.UITabBarController, Xamarin.iOS", "UIKit.UIViewController, Xamarin.iOS", "UIKit.UITabBarController+_UITabBarControllerDelegate, Xamarin.iOS", "ViewControllerSelected");
	}

	-(BOOL) respondsToSelector:(SEL)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_72 (self, _cmd, &managed_method, p0, "ObjCRuntime.Selector, Xamarin.iOS", "UIKit.UITabBarController+_UITabBarControllerDelegate, Xamarin.iOS", "RespondsToSelector");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_8 (self, _cmd, &managed_method, "UIKit.UITabBarController+_UITabBarControllerDelegate, Xamarin.iOS", ".ctor", &call_super);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface UIKit_UIWebView__UIWebViewDelegate : NSObject<UIWebViewDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) webView:(UIWebView *)p0 didFailLoadWithError:(NSError *)p1;
	-(void) webViewDidFinishLoad:(UIWebView *)p0;
	-(void) webViewDidStartLoad:(UIWebView *)p0;
	-(BOOL) webView:(UIWebView *)p0 shouldStartLoadWithRequest:(NSURLRequest *)p1 navigationType:(NSInteger)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation UIKit_UIWebView__UIWebViewDelegate { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) webView:(UIWebView *)p0 didFailLoadWithError:(NSError *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_73 (self, _cmd, &managed_method, p0, p1, "UIKit.UIWebView, Xamarin.iOS", "Foundation.NSError, Xamarin.iOS", "UIKit.UIWebView+_UIWebViewDelegate, Xamarin.iOS", "LoadFailed");
	}

	-(void) webViewDidFinishLoad:(UIWebView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_74 (self, _cmd, &managed_method, p0, "UIKit.UIWebView, Xamarin.iOS", "UIKit.UIWebView+_UIWebViewDelegate, Xamarin.iOS", "LoadingFinished");
	}

	-(void) webViewDidStartLoad:(UIWebView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_74 (self, _cmd, &managed_method, p0, "UIKit.UIWebView, Xamarin.iOS", "UIKit.UIWebView+_UIWebViewDelegate, Xamarin.iOS", "LoadStarted");
	}

	-(BOOL) webView:(UIWebView *)p0 shouldStartLoadWithRequest:(NSURLRequest *)p1 navigationType:(NSInteger)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_75 (self, _cmd, &managed_method, p0, p1, p2, "UIKit.UIWebView, Xamarin.iOS", "Foundation.NSUrlRequest, Xamarin.iOS", "UIKit.UIWebViewNavigationType, Xamarin.iOS", "UIKit.UIWebView+_UIWebViewDelegate, Xamarin.iOS", "ShouldStartLoad");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface Xamarin_Controls__MobileServices_ProgressLabel : UIView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation Xamarin_Controls__MobileServices_ProgressLabel { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface Xamarin_Auth__MobileServices_FormAuthenticatorController_FormDelegate : NSObject<UITableViewDelegate, UIScrollViewDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation Xamarin_Auth__MobileServices_FormAuthenticatorController_FormDelegate { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_28 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "Xamarin.Auth._MobileServices.FormAuthenticatorController+FormDelegate, Microsoft.WindowsAzure.Mobile.Ext", "RowSelected");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface Xamarin_Auth__MobileServices_FormAuthenticatorController : UITableViewController {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation Xamarin_Auth__MobileServices_FormAuthenticatorController { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface Xamarin_Auth__MobileServices_WebAuthenticatorController_WebViewDelegate : NSObject<UIWebViewDelegate> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(BOOL) webView:(UIWebView *)p0 shouldStartLoadWithRequest:(NSURLRequest *)p1 navigationType:(NSInteger)p2;
	-(void) webViewDidStartLoad:(UIWebView *)p0;
	-(void) webView:(UIWebView *)p0 didFailLoadWithError:(NSError *)p1;
	-(void) webViewDidFinishLoad:(UIWebView *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation Xamarin_Auth__MobileServices_WebAuthenticatorController_WebViewDelegate { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(BOOL) webView:(UIWebView *)p0 shouldStartLoadWithRequest:(NSURLRequest *)p1 navigationType:(NSInteger)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_75 (self, _cmd, &managed_method, p0, p1, p2, "UIKit.UIWebView, Xamarin.iOS", "Foundation.NSUrlRequest, Xamarin.iOS", "UIKit.UIWebViewNavigationType, Xamarin.iOS", "Xamarin.Auth._MobileServices.WebAuthenticatorController+WebViewDelegate, Microsoft.WindowsAzure.Mobile.Ext", "ShouldStartLoad");
	}

	-(void) webViewDidStartLoad:(UIWebView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_74 (self, _cmd, &managed_method, p0, "UIKit.UIWebView, Xamarin.iOS", "Xamarin.Auth._MobileServices.WebAuthenticatorController+WebViewDelegate, Microsoft.WindowsAzure.Mobile.Ext", "LoadStarted");
	}

	-(void) webView:(UIWebView *)p0 didFailLoadWithError:(NSError *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_73 (self, _cmd, &managed_method, p0, p1, "UIKit.UIWebView, Xamarin.iOS", "Foundation.NSError, Xamarin.iOS", "Xamarin.Auth._MobileServices.WebAuthenticatorController+WebViewDelegate, Microsoft.WindowsAzure.Mobile.Ext", "LoadFailed");
	}

	-(void) webViewDidFinishLoad:(UIWebView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_74 (self, _cmd, &managed_method, p0, "UIKit.UIWebView, Xamarin.iOS", "Xamarin.Auth._MobileServices.WebAuthenticatorController+WebViewDelegate, Microsoft.WindowsAzure.Mobile.Ext", "LoadingFinished");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface Xamarin_Auth__MobileServices_WebAuthenticatorController : UIViewController {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation Xamarin_Auth__MobileServices_WebAuthenticatorController { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface Xamarin_Auth__MobileServices_FormAuthenticatorController_FieldCell : UITableViewCell {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation Xamarin_Auth__MobileServices_FormAuthenticatorController_FieldCell { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

@interface Xamarin_Auth__MobileServices_FormAuthenticatorController_FormDataSource : NSObject<UITableViewDataSource> {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) numberOfSectionsInTableView:(UITableView *)p0;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end
@implementation Xamarin_Auth__MobileServices_FormAuthenticatorController_FormDataSource { } 
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(int) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(void) xamarinSetGCHandle: (int) gc_handle
	{
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.native_object = self;
	}


	-(NSInteger) numberOfSectionsInTableView:(UITableView *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_76 (self, _cmd, &managed_method, p0, "UIKit.UITableView, Xamarin.iOS", "Xamarin.Auth._MobileServices.FormAuthenticatorController+FormDataSource, Microsoft.WindowsAzure.Mobile.Ext", "NumberOfSections");
	}

	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "System.nint, Xamarin.iOS", "Xamarin.Auth._MobileServices.FormAuthenticatorController+FormDataSource, Microsoft.WindowsAzure.Mobile.Ext", "RowsInSection");
	}

	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_22 (self, _cmd, &managed_method, p0, p1, "UIKit.UITableView, Xamarin.iOS", "Foundation.NSIndexPath, Xamarin.iOS", "Xamarin.Auth._MobileServices.FormAuthenticatorController+FormDataSource, Microsoft.WindowsAzure.Mobile.Ext", "GetCell");
	}

	-(BOOL) conformsToProtocol:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, "System.IntPtr, mscorlib", "Foundation.NSObject, Xamarin.iOS", "InvokeConformsToProtocol");
	}
@end

	static MTClassMap __xamarin_class_map [] = {
		{"NSObject", "Foundation.NSObject, Xamarin.iOS", NULL },
		{"UIResponder", "UIKit.UIResponder, Xamarin.iOS", NULL },
		{"UIViewController", "UIKit.UIViewController, Xamarin.iOS", NULL },
		{"UIView", "UIKit.UIView, Xamarin.iOS", NULL },
		{"UITableViewCell", "UIKit.UITableViewCell, Xamarin.iOS", NULL },
		{"UICollectionReusableView", "UIKit.UICollectionReusableView, Xamarin.iOS", NULL },
		{"UICollectionViewCell", "UIKit.UICollectionViewCell, Xamarin.iOS", NULL },
		{"UITabBarController", "UIKit.UITabBarController, Xamarin.iOS", NULL },
		{"ACAccount", "Accounts.ACAccount, Xamarin.iOS", NULL },
		{"ACAccountStore", "Accounts.ACAccountStore, Xamarin.iOS", NULL },
		{"AVCaptureConnection", "AVFoundation.AVCaptureConnection, Xamarin.iOS", NULL },
		{"AVCaptureInput", "AVFoundation.AVCaptureInput, Xamarin.iOS", NULL },
		{"AVCaptureDeviceInput", "AVFoundation.AVCaptureDeviceInput, Xamarin.iOS", NULL },
		{"NSIndexPath", "Foundation.NSIndexPath, Xamarin.iOS", NULL },
		{"NSUserActivity", "Foundation.NSUserActivity, Xamarin.iOS", NULL },
		{"NSArray", "Foundation.NSArray, Xamarin.iOS", NULL },
		{"NSBundle", "Foundation.NSBundle, Xamarin.iOS", NULL },
		{"NSCoder", "Foundation.NSCoder, Xamarin.iOS", NULL },
		{"NSHTTPCookie", "Foundation.NSHttpCookie, Xamarin.iOS", NULL },
		{"NSHTTPCookieStorage", "Foundation.NSHttpCookieStorage, Xamarin.iOS", NULL },
		{"NSMutableArray", "Foundation.NSMutableArray, Xamarin.iOS", NULL },
		{"NSSet", "Foundation.NSSet, Xamarin.iOS", NULL },
		{"NSMutableSet", "Foundation.NSMutableSet, Xamarin.iOS", NULL },
		{"NSURLRequest", "Foundation.NSUrlRequest, Xamarin.iOS", NULL },
		{"Foundation_InternalNSNotificationHandler", "Foundation.InternalNSNotificationHandler, Xamarin.iOS", NULL },
		{"NSValue", "Foundation.NSValue, Xamarin.iOS", NULL },
		{"NSNumber", "Foundation.NSNumber, Xamarin.iOS", NULL },
		{"NSRunLoop", "Foundation.NSRunLoop, Xamarin.iOS", NULL },
		{"NSString", "Foundation.NSString, Xamarin.iOS", NULL },
		{"NSURL", "Foundation.NSUrl, Xamarin.iOS", NULL },
		{"NSUserDefaults", "Foundation.NSUserDefaults, Xamarin.iOS", NULL },
		{"CKShareMetadata", "CloudKit.CKShareMetadata, Xamarin.iOS", NULL },
		{"CAAnimation", "CoreAnimation.CAAnimation, Xamarin.iOS", NULL },
		{"CALayer", "CoreAnimation.CALayer, Xamarin.iOS", NULL },
		{"CAGradientLayer", "CoreAnimation.CAGradientLayer, Xamarin.iOS", NULL },
		{"CAMediaTimingFunction", "CoreAnimation.CAMediaTimingFunction, Xamarin.iOS", NULL },
		{"CIImage", "CoreImage.CIImage, Xamarin.iOS", NULL },
		{"UIActivityViewController", "UIKit.UIActivityViewController, Xamarin.iOS", NULL },
		{"UIApplication", "UIKit.UIApplication, Xamarin.iOS", NULL },
		{"UIBarItem", "UIKit.UIBarItem, Xamarin.iOS", NULL },
		{"UIBezierPath", "UIKit.UIBezierPath, Xamarin.iOS", NULL },
		{"UIControl", "UIKit.UIControl, Xamarin.iOS", NULL },
		{"UIButton", "UIKit.UIButton, Xamarin.iOS", NULL },
		{"UIScrollView", "UIKit.UIScrollView, Xamarin.iOS", NULL },
		{"UICollectionView", "UIKit.UICollectionView, Xamarin.iOS", NULL },
		{"UICollectionViewLayout", "UIKit.UICollectionViewLayout, Xamarin.iOS", NULL },
		{"UICollectionViewTransitionLayout", "UIKit.UICollectionViewTransitionLayout, Xamarin.iOS", NULL },
		{"UIColor", "UIKit.UIColor, Xamarin.iOS", NULL },
		{"UIKit_UIControlEventProxy", "UIKit.UIControlEventProxy, Xamarin.iOS", NULL },
		{"UIDevice", "UIKit.UIDevice, Xamarin.iOS", NULL },
		{"UIPresentationController", "UIKit.UIPresentationController, Xamarin.iOS", NULL },
		{"UIEvent", "UIKit.UIEvent, Xamarin.iOS", NULL },
		{"UINavigationController", "UIKit.UINavigationController, Xamarin.iOS", NULL },
		{"UIFont", "UIKit.UIFont, Xamarin.iOS", NULL },
		{"CATransition", "CoreAnimation.CATransition, Xamarin.iOS", NULL },
		{"UIImage", "UIKit.UIImage, Xamarin.iOS", NULL },
		{"UITableView", "UIKit.UITableView, Xamarin.iOS", NULL },
		{"UIPopoverController", "UIKit.UIPopoverController, Xamarin.iOS", NULL },
		{"UITraitCollection", "UIKit.UITraitCollection, Xamarin.iOS", NULL },
		{"UIPopoverPresentationController", "UIKit.UIPopoverPresentationController, Xamarin.iOS", NULL },
		{"UIScreen", "UIKit.UIScreen, Xamarin.iOS", NULL },
		{"__MonoMac_NSActionDispatcher", "Foundation.NSActionDispatcher, Xamarin.iOS", NULL },
		{"__MonoMac_NSAsyncActionDispatcher", "Foundation.NSAsyncActionDispatcher, Xamarin.iOS", NULL },
		{"NSAutoreleasePool", "Foundation.NSAutoreleasePool, Xamarin.iOS", NULL },
		{"NSError", "Foundation.NSError, Xamarin.iOS", NULL },
		{"AVCaptureBracketedStillImageSettings", "AVFoundation.AVCaptureBracketedStillImageSettings, Xamarin.iOS", NULL },
		{"AVCaptureAutoExposureBracketedStillImageSettings", "AVFoundation.AVCaptureAutoExposureBracketedStillImageSettings, Xamarin.iOS", NULL },
		{"AVCaptureDevice", "AVFoundation.AVCaptureDevice, Xamarin.iOS", NULL },
		{"AVCaptureOutput", "AVFoundation.AVCaptureOutput, Xamarin.iOS", NULL },
		{"AVCaptureStillImageOutput", "AVFoundation.AVCaptureStillImageOutput, Xamarin.iOS", NULL },
		{"AVCaptureVideoDataOutput", "AVFoundation.AVCaptureVideoDataOutput, Xamarin.iOS", NULL },
		{"AVCaptureSession", "AVFoundation.AVCaptureSession, Xamarin.iOS", NULL },
		{"UIActivity", "UIKit.UIActivity, Xamarin.iOS", NULL },
		{"UIActivityIndicatorView", "UIKit.UIActivityIndicatorView, Xamarin.iOS", NULL },
		{"UIAlertAction", "UIKit.UIAlertAction, Xamarin.iOS", NULL },
		{"UIAlertController", "UIKit.UIAlertController, Xamarin.iOS", NULL },
		{"UIApplicationShortcutItem", "UIKit.UIApplicationShortcutItem, Xamarin.iOS", NULL },
		{"NSException", "Foundation.NSException, Xamarin.iOS", NULL },
		{"NSEnumerator", "Foundation.NSEnumerator, Xamarin.iOS", NULL },
		{"NSNotification", "Foundation.NSNotification, Xamarin.iOS", NULL },
		{"UICollectionViewFlowLayout", "UIKit.UICollectionViewFlowLayout, Xamarin.iOS", NULL },
		{"UIFocusUpdateContext", "UIKit.UIFocusUpdateContext, Xamarin.iOS", NULL },
		{"UICollectionViewFocusUpdateContext", "UIKit.UICollectionViewFocusUpdateContext, Xamarin.iOS", NULL },
		{"NSNull", "Foundation.NSNull, Xamarin.iOS", NULL },
		{"UICubicTimingParameters", "UIKit.UICubicTimingParameters, Xamarin.iOS", NULL },
		{"NSURLCache", "Foundation.NSUrlCache, Xamarin.iOS", NULL },
		{"UIFocusAnimationCoordinator", "UIKit.UIFocusAnimationCoordinator, Xamarin.iOS", NULL },
		{"UIImageView", "UIKit.UIImageView, Xamarin.iOS", NULL },
		{"UILabel", "UIKit.UILabel, Xamarin.iOS", NULL },
		{"UILocalNotification", "UIKit.UILocalNotification, Xamarin.iOS", NULL },
		{"UIPress", "UIKit.UIPress, Xamarin.iOS", NULL },
		{"UINavigationItem", "UIKit.UINavigationItem, Xamarin.iOS", NULL },
		{"UIPageControl", "UIKit.UIPageControl, Xamarin.iOS", NULL },
		{"UITabBarItem", "UIKit.UITabBarItem, Xamarin.iOS", NULL },
		{"UIStoryboard", "UIKit.UIStoryboard, Xamarin.iOS", NULL },
		{"UITableViewFocusUpdateContext", "UIKit.UITableViewFocusUpdateContext, Xamarin.iOS", NULL },
		{"UITableViewRowAction", "UIKit.UITableViewRowAction, Xamarin.iOS", NULL },
		{"UITextPosition", "UIKit.UITextPosition, Xamarin.iOS", NULL },
		{"UITableViewController", "UIKit.UITableViewController, Xamarin.iOS", NULL },
		{"UITextRange", "UIKit.UITextRange, Xamarin.iOS", NULL },
		{"UITextSelectionRect", "UIKit.UITextSelectionRect, Xamarin.iOS", NULL },
		{"UISpringTimingParameters", "UIKit.UISpringTimingParameters, Xamarin.iOS", NULL },
		{"UIUserNotificationSettings", "UIKit.UIUserNotificationSettings, Xamarin.iOS", NULL },
		{"UIWindow", "UIKit.UIWindow, Xamarin.iOS", NULL },
		{"UITouch", "UIKit.UITouch, Xamarin.iOS", NULL },
		{"NSData", "Foundation.NSData, Xamarin.iOS", NULL },
		{"NSDictionary", "Foundation.NSDictionary, Xamarin.iOS", NULL },
		{"NSMutableDictionary", "Foundation.NSMutableDictionary, Xamarin.iOS", NULL },
		{"NSNotificationCenter", "Foundation.NSNotificationCenter, Xamarin.iOS", NULL },
		{"UIAlertView", "UIKit.UIAlertView, Xamarin.iOS", NULL },
		{"UIBarButtonItem", "UIKit.UIBarButtonItem, Xamarin.iOS", NULL },
		{"UIGestureRecognizer", "UIKit.UIGestureRecognizer, Xamarin.iOS", NULL },
		{"UITapGestureRecognizer", "UIKit.UITapGestureRecognizer, Xamarin.iOS", NULL },
		{"UIImagePickerController", "UIKit.UIImagePickerController, Xamarin.iOS", NULL },
		{"UITextField", "UIKit.UITextField, Xamarin.iOS", NULL },
		{"UISearchBar", "UIKit.UISearchBar, Xamarin.iOS", NULL },
		{"UITabBar", "UIKit.UITabBar, Xamarin.iOS", NULL },
		{"UIWebView", "UIKit.UIWebView, Xamarin.iOS", NULL },
		{"AppDelegate", "JD.iPhone.AppDelegate, JD.iPhone", NULL },
		{"BaseVC", "JD.iPhone.BaseVC, JD.iPhone", NULL },
		{"HomeVC", "JD.iPhone.HomeVC, JD.iPhone", NULL },
		{"GradientView", "Xamarin.GradientView, JD.iPhone", NULL },
		{"JD_iPhone_ExportTableSource", "JD.iPhone.ExportTableSource, JD.iPhone", NULL },
		{"ExportVC", "JD.iPhone.ExportVC, JD.iPhone", NULL },
		{"BaseCell", "JD.iPhone.BaseCell, JD.iPhone", NULL },
		{"CategoryCell", "JD.iPhone.CategoryCell, JD.iPhone", NULL },
		{"ExportCell", "JD.iPhone.ExportCell, JD.iPhone", NULL },
		{"JD_iPhone_ResourceTableSource", "JD.iPhone.ResourceTableSource, JD.iPhone", NULL },
		{"ResourcesVC", "JD.iPhone.ResourcesVC, JD.iPhone", NULL },
		{"JD_iPhone_AlertTableSource", "JD.iPhone.AlertTableSource, JD.iPhone", NULL },
		{"AlertVC", "JD.iPhone.AlertVC, JD.iPhone", NULL },
		{"AlertCell", "JD.iPhone.AlertCell, JD.iPhone", NULL },
		{"JD_iPhone_SettingsTableSource", "JD.iPhone.SettingsTableSource, JD.iPhone", NULL },
		{"SettingsVC", "JD.iPhone.SettingsVC, JD.iPhone", NULL },
		{"JD_iPhone_SearchTableSource", "JD.iPhone.SearchTableSource, JD.iPhone", NULL },
		{"SearchVC", "JD.iPhone.SearchVC, JD.iPhone", NULL },
		{"FileCell", "JD.iPhone.FileCell, JD.iPhone", NULL },
		{"JD_iPhone_CategorySource", "JD.iPhone.CategorySource, JD.iPhone", NULL },
		{"CategoryVC", "JD.iPhone.CategoryVC, JD.iPhone", NULL },
		{"SearchCell", "JD.iPhone.SearchCell, JD.iPhone", NULL },
		{"JD_iPhone_ProfileTableSource", "JD.iPhone.ProfileTableSource, JD.iPhone", NULL },
		{"ProfileVC", "JD.iPhone.ProfileVC, JD.iPhone", NULL },
		{"ProfileCell", "JD.iPhone.ProfileCell, JD.iPhone", NULL },
		{"JD_iPhone_NotificationTableSource", "JD.iPhone.NotificationTableSource, JD.iPhone", NULL },
		{"NotificationVC", "JD.iPhone.NotificationVC, JD.iPhone", NULL },
		{"LoginVC", "JD.iPhone.LoginVC, JD.iPhone", NULL },
		{"CheckCell", "JD.iPhone.CheckCell, JD.iPhone", NULL },
		{"JD_iPhone_TableSource", "JD.iPhone.TableSource, JD.iPhone", NULL },
		{"CategoryCollectionCell", "JD.iPhone.CategoryCollectionCell, JD.iPhone", NULL },
		{"ThankyouVC", "JD.iPhone.ThankyouVC, JD.iPhone", NULL },
		{"OnboardingVC", "JD.iPhone.OnboardingVC, JD.iPhone", NULL },
		{"MainTapBarVC", "JD.iPhone.MainTapBarVC, JD.iPhone", NULL },
		{"MainTabMenuVC", "JD.iPhone.MainTabMenuVC, JD.iPhone", NULL },
		{"JD_iPhone_SingleFileTableSource", "JD.iPhone.SingleFileTableSource, JD.iPhone", NULL },
		{"CategorySingleFileVC", "JD.iPhone.CategorySingleFileVC, JD.iPhone", NULL },
		{"SingleCategoryCell", "JD.iPhone.SingleCategoryCell, JD.iPhone", NULL },
		{"CameraVC", "JD.iPhone.CameraVC, JD.iPhone", NULL },
		{"JD_iPhone_CEEditTableSource", "JD.iPhone.CEEditTableSource, JD.iPhone", NULL },
		{"CEEditContentsVC", "JD.iPhone.CEEditContentsVC, JD.iPhone", NULL },
		{"JD_iPhone_CESaveTableSource", "JD.iPhone.CESaveTableSource, JD.iPhone", NULL },
		{"CESaveContentsVC", "JD.iPhone.CESaveContentsVC, JD.iPhone", NULL },
		{"PhotoCroppingVC", "JD.iPhone.PhotoCroppingVC, JD.iPhone", NULL },
		{"JD_iPhone_ResizingFrame", "JD.iPhone.ResizingFrame, JD.iPhone", NULL },
		{"RegistrationVC", "JD.iPhone.RegistrationVC, JD.iPhone", NULL },
		{"JD_iPhone_JobTableSource", "JD.iPhone.JobTableSource, JD.iPhone", NULL },
		{"JD_iPhone_RoleTablesource", "JD.iPhone.RoleTablesource, JD.iPhone", NULL },
		{"SelectRoleVC", "JD.iPhone.SelectRoleVC, JD.iPhone", NULL },
		{"JD_iPhone_SaveLocationSource", "JD.iPhone.SaveLocationSource, JD.iPhone", NULL },
		{"SaveLocationVC", "JD.iPhone.SaveLocationVC, JD.iPhone", NULL },
		{"JD_iPhone_LoadingOverlay", "JD.iPhone.LoadingOverlay, JD.iPhone", NULL },
		{"CreateAccountJobVC", "JD.iPhone.CreateAccountJobVC, JD.iPhone", NULL },
		{"JD_iPhone_ConfirmCategorySource", "JD.iPhone.ConfirmCategorySource, JD.iPhone", NULL },
		{"JD_iPhone_ConfirmTableSource", "JD.iPhone.ConfirmTableSource, JD.iPhone", NULL },
		{"ConfirmInfoVC", "JD.iPhone.ConfirmInfoVC, JD.iPhone", NULL },
		{"JD_iPhone_CategoryCollectionSource", "JD.iPhone.CategoryCollectionSource, JD.iPhone", NULL },
		{"SelectCategoryVC", "JD.iPhone.SelectCategoryVC, JD.iPhone", NULL },
		{"JD_API_Job", "JD.API.Job, JD.iPhone", NULL },
		{"JD_iPhone_OutputRecorder", "JD.iPhone.OutputRecorder, JD.iPhone", NULL },
		{"SelectJobVC", "JD.iPhone.SelectJobVC, JD.iPhone", NULL },
		{"JD_iPhone_DocumentCell_ImageScrollDelegate", "JD.iPhone.DocumentCell+ImageScrollDelegate, JD.iPhone", NULL },
		{"DocumentCell", "JD.iPhone.DocumentCell, JD.iPhone", NULL },
		{"UIKit_UIAlertView__UIAlertViewDelegate", "UIKit.UIAlertView+_UIAlertViewDelegate, Xamarin.iOS", NULL },
		{"UIKit_UIBarButtonItem_Callback", "UIKit.UIBarButtonItem+Callback, Xamarin.iOS", NULL },
		{"__UIGestureRecognizerToken", "UIKit.UIGestureRecognizer+Token, Xamarin.iOS", NULL },
		{"__UIGestureRecognizerParameterlessToken", "UIKit.UIGestureRecognizer+ParameterlessDispatch, Xamarin.iOS", NULL },
		{"__UIGestureRecognizerParametrizedToken", "UIKit.UIGestureRecognizer+ParametrizedDispatch, Xamarin.iOS", NULL },
		{"__UITapGestureRecognizer", "UIKit.UITapGestureRecognizer+Callback, Xamarin.iOS", NULL },
		{"UIKit_UIImagePickerController__UIImagePickerControllerDelegate", "UIKit.UIImagePickerController+_UIImagePickerControllerDelegate, Xamarin.iOS", NULL },
		{"UIKit_UITextField__UITextFieldDelegate", "UIKit.UITextField+_UITextFieldDelegate, Xamarin.iOS", NULL },
		{"UIKit_UIView_UIViewAppearance", "UIKit.UIView+UIViewAppearance, Xamarin.iOS", NULL },
		{"UIKit_UISearchBar__UISearchBarDelegate", "UIKit.UISearchBar+_UISearchBarDelegate, Xamarin.iOS", NULL },
		{"__NSObject_Disposer", "Foundation.NSObject+NSObject_Disposer, Xamarin.iOS", NULL },
		{"UIKit_UIScrollView__UIScrollViewDelegate", "UIKit.UIScrollView+_UIScrollViewDelegate, Xamarin.iOS", NULL },
		{"UIKit_UITabBar_UITabBarAppearance", "UIKit.UITabBar+UITabBarAppearance, Xamarin.iOS", NULL },
		{"UIKit_UITabBarController__UITabBarControllerDelegate", "UIKit.UITabBarController+_UITabBarControllerDelegate, Xamarin.iOS", NULL },
		{"UIKit_UIWebView__UIWebViewDelegate", "UIKit.UIWebView+_UIWebViewDelegate, Xamarin.iOS", NULL },
		{"Xamarin_Controls__MobileServices_ProgressLabel", "Xamarin.Controls._MobileServices.ProgressLabel, Microsoft.WindowsAzure.Mobile.Ext", NULL },
		{"Xamarin_Auth__MobileServices_FormAuthenticatorController_FormDelegate", "Xamarin.Auth._MobileServices.FormAuthenticatorController+FormDelegate, Microsoft.WindowsAzure.Mobile.Ext", NULL },
		{"Xamarin_Auth__MobileServices_FormAuthenticatorController", "Xamarin.Auth._MobileServices.FormAuthenticatorController, Microsoft.WindowsAzure.Mobile.Ext", NULL },
		{"Xamarin_Auth__MobileServices_WebAuthenticatorController_WebViewDelegate", "Xamarin.Auth._MobileServices.WebAuthenticatorController+WebViewDelegate, Microsoft.WindowsAzure.Mobile.Ext", NULL },
		{"Xamarin_Auth__MobileServices_WebAuthenticatorController", "Xamarin.Auth._MobileServices.WebAuthenticatorController, Microsoft.WindowsAzure.Mobile.Ext", NULL },
		{"Xamarin_Auth__MobileServices_FormAuthenticatorController_FieldCell", "Xamarin.Auth._MobileServices.FormAuthenticatorController+FieldCell, Microsoft.WindowsAzure.Mobile.Ext", NULL },
		{"Xamarin_Auth__MobileServices_FormAuthenticatorController_FormDataSource", "Xamarin.Auth._MobileServices.FormAuthenticatorController+FormDataSource, Microsoft.WindowsAzure.Mobile.Ext", NULL },
		{ NULL, NULL, NULL },
	};

	static const char *__xamarin_registration_assemblies []= {
		"JD.iPhone", 
		"Xamarin.iOS", 
		"mscorlib", 
		"System", 
		"System.Xml", 
		"System.Core", 
		"Mono.Dynamic.Interpreter", 
		"Microsoft.WindowsAzure.Mobile.Ext", 
		"Microsoft.WindowsAzure.Mobile", 
		"Newtonsoft.Json", 
		"System.Xml.Linq", 
		"System.Runtime.Serialization", 
		"Microsoft.CSharp", 
		"Mono.CSharp", 
		"System.Net.Http", 
		"System.Net.Http.Primitives"
	};

	static struct MTRegistrationMap __xamarin_registration_map = {
		NULL,
		__xamarin_registration_assemblies,
		__xamarin_class_map,
		16,
		203,
		85
	};

void xamarin_create_classes () {
	__xamarin_class_map [0].handle = objc_getClass ("NSObject");
	__xamarin_class_map [1].handle = objc_getClass ("UIResponder");
	__xamarin_class_map [2].handle = objc_getClass ("UIViewController");
	__xamarin_class_map [3].handle = objc_getClass ("UIView");
	__xamarin_class_map [4].handle = objc_getClass ("UITableViewCell");
	__xamarin_class_map [5].handle = objc_getClass ("UICollectionReusableView");
	__xamarin_class_map [6].handle = objc_getClass ("UICollectionViewCell");
	__xamarin_class_map [7].handle = objc_getClass ("UITabBarController");
	__xamarin_class_map [8].handle = objc_getClass ("ACAccount");
	__xamarin_class_map [9].handle = objc_getClass ("ACAccountStore");
	__xamarin_class_map [10].handle = objc_getClass ("AVCaptureConnection");
	__xamarin_class_map [11].handle = objc_getClass ("AVCaptureInput");
	__xamarin_class_map [12].handle = objc_getClass ("AVCaptureDeviceInput");
	__xamarin_class_map [13].handle = objc_getClass ("NSIndexPath");
	__xamarin_class_map [14].handle = objc_getClass ("NSUserActivity");
	__xamarin_class_map [15].handle = objc_getClass ("NSArray");
	__xamarin_class_map [16].handle = objc_getClass ("NSBundle");
	__xamarin_class_map [17].handle = objc_getClass ("NSCoder");
	__xamarin_class_map [18].handle = objc_getClass ("NSHTTPCookie");
	__xamarin_class_map [19].handle = objc_getClass ("NSHTTPCookieStorage");
	__xamarin_class_map [20].handle = objc_getClass ("NSMutableArray");
	__xamarin_class_map [21].handle = objc_getClass ("NSSet");
	__xamarin_class_map [22].handle = objc_getClass ("NSMutableSet");
	__xamarin_class_map [23].handle = objc_getClass ("NSURLRequest");
	__xamarin_class_map [24].handle = objc_getClass ("Foundation_InternalNSNotificationHandler");
	__xamarin_class_map [25].handle = objc_getClass ("NSValue");
	__xamarin_class_map [26].handle = objc_getClass ("NSNumber");
	__xamarin_class_map [27].handle = objc_getClass ("NSRunLoop");
	__xamarin_class_map [28].handle = objc_getClass ("NSString");
	__xamarin_class_map [29].handle = objc_getClass ("NSURL");
	__xamarin_class_map [30].handle = objc_getClass ("NSUserDefaults");
	__xamarin_class_map [31].handle = objc_getClass ("CKShareMetadata");
	__xamarin_class_map [32].handle = objc_getClass ("CAAnimation");
	__xamarin_class_map [33].handle = objc_getClass ("CALayer");
	__xamarin_class_map [34].handle = objc_getClass ("CAGradientLayer");
	__xamarin_class_map [35].handle = objc_getClass ("CAMediaTimingFunction");
	__xamarin_class_map [36].handle = objc_getClass ("CIImage");
	__xamarin_class_map [37].handle = objc_getClass ("UIActivityViewController");
	__xamarin_class_map [38].handle = objc_getClass ("UIApplication");
	__xamarin_class_map [39].handle = objc_getClass ("UIBarItem");
	__xamarin_class_map [40].handle = objc_getClass ("UIBezierPath");
	__xamarin_class_map [41].handle = objc_getClass ("UIControl");
	__xamarin_class_map [42].handle = objc_getClass ("UIButton");
	__xamarin_class_map [43].handle = objc_getClass ("UIScrollView");
	__xamarin_class_map [44].handle = objc_getClass ("UICollectionView");
	__xamarin_class_map [45].handle = objc_getClass ("UICollectionViewLayout");
	__xamarin_class_map [46].handle = objc_getClass ("UICollectionViewTransitionLayout");
	__xamarin_class_map [47].handle = objc_getClass ("UIColor");
	__xamarin_class_map [48].handle = objc_getClass ("UIKit_UIControlEventProxy");
	__xamarin_class_map [49].handle = objc_getClass ("UIDevice");
	__xamarin_class_map [50].handle = objc_getClass ("UIPresentationController");
	__xamarin_class_map [51].handle = objc_getClass ("UIEvent");
	__xamarin_class_map [52].handle = objc_getClass ("UINavigationController");
	__xamarin_class_map [53].handle = objc_getClass ("UIFont");
	__xamarin_class_map [54].handle = objc_getClass ("CATransition");
	__xamarin_class_map [55].handle = objc_getClass ("UIImage");
	__xamarin_class_map [56].handle = objc_getClass ("UITableView");
	__xamarin_class_map [57].handle = objc_getClass ("UIPopoverController");
	__xamarin_class_map [58].handle = objc_getClass ("UITraitCollection");
	__xamarin_class_map [59].handle = objc_getClass ("UIPopoverPresentationController");
	__xamarin_class_map [60].handle = objc_getClass ("UIScreen");
	__xamarin_class_map [61].handle = objc_getClass ("__MonoMac_NSActionDispatcher");
	__xamarin_class_map [62].handle = objc_getClass ("__MonoMac_NSAsyncActionDispatcher");
	__xamarin_class_map [63].handle = objc_getClass ("NSAutoreleasePool");
	__xamarin_class_map [64].handle = objc_getClass ("NSError");
	__xamarin_class_map [65].handle = objc_getClass ("AVCaptureBracketedStillImageSettings");
	__xamarin_class_map [66].handle = objc_getClass ("AVCaptureAutoExposureBracketedStillImageSettings");
	__xamarin_class_map [67].handle = objc_getClass ("AVCaptureDevice");
	__xamarin_class_map [68].handle = objc_getClass ("AVCaptureOutput");
	__xamarin_class_map [69].handle = objc_getClass ("AVCaptureStillImageOutput");
	__xamarin_class_map [70].handle = objc_getClass ("AVCaptureVideoDataOutput");
	__xamarin_class_map [71].handle = objc_getClass ("AVCaptureSession");
	__xamarin_class_map [72].handle = objc_getClass ("UIActivity");
	__xamarin_class_map [73].handle = objc_getClass ("UIActivityIndicatorView");
	__xamarin_class_map [74].handle = objc_getClass ("UIAlertAction");
	__xamarin_class_map [75].handle = objc_getClass ("UIAlertController");
	__xamarin_class_map [76].handle = objc_getClass ("UIApplicationShortcutItem");
	__xamarin_class_map [77].handle = objc_getClass ("NSException");
	__xamarin_class_map [78].handle = objc_getClass ("NSEnumerator");
	__xamarin_class_map [79].handle = objc_getClass ("NSNotification");
	__xamarin_class_map [80].handle = objc_getClass ("UICollectionViewFlowLayout");
	__xamarin_class_map [81].handle = objc_getClass ("UIFocusUpdateContext");
	__xamarin_class_map [82].handle = objc_getClass ("UICollectionViewFocusUpdateContext");
	__xamarin_class_map [83].handle = objc_getClass ("NSNull");
	__xamarin_class_map [84].handle = objc_getClass ("UICubicTimingParameters");
	__xamarin_class_map [85].handle = objc_getClass ("NSURLCache");
	__xamarin_class_map [86].handle = objc_getClass ("UIFocusAnimationCoordinator");
	__xamarin_class_map [87].handle = objc_getClass ("UIImageView");
	__xamarin_class_map [88].handle = objc_getClass ("UILabel");
	__xamarin_class_map [89].handle = objc_getClass ("UILocalNotification");
	__xamarin_class_map [90].handle = objc_getClass ("UIPress");
	__xamarin_class_map [91].handle = objc_getClass ("UINavigationItem");
	__xamarin_class_map [92].handle = objc_getClass ("UIPageControl");
	__xamarin_class_map [93].handle = objc_getClass ("UITabBarItem");
	__xamarin_class_map [94].handle = objc_getClass ("UIStoryboard");
	__xamarin_class_map [95].handle = objc_getClass ("UITableViewFocusUpdateContext");
	__xamarin_class_map [96].handle = objc_getClass ("UITableViewRowAction");
	__xamarin_class_map [97].handle = objc_getClass ("UITextPosition");
	__xamarin_class_map [98].handle = objc_getClass ("UITableViewController");
	__xamarin_class_map [99].handle = objc_getClass ("UITextRange");
	__xamarin_class_map [100].handle = objc_getClass ("UITextSelectionRect");
	__xamarin_class_map [101].handle = objc_getClass ("UISpringTimingParameters");
	__xamarin_class_map [102].handle = objc_getClass ("UIUserNotificationSettings");
	__xamarin_class_map [103].handle = objc_getClass ("UIWindow");
	__xamarin_class_map [104].handle = objc_getClass ("UITouch");
	__xamarin_class_map [105].handle = objc_getClass ("NSData");
	__xamarin_class_map [106].handle = objc_getClass ("NSDictionary");
	__xamarin_class_map [107].handle = objc_getClass ("NSMutableDictionary");
	__xamarin_class_map [108].handle = objc_getClass ("NSNotificationCenter");
	__xamarin_class_map [109].handle = objc_getClass ("UIAlertView");
	__xamarin_class_map [110].handle = objc_getClass ("UIBarButtonItem");
	__xamarin_class_map [111].handle = objc_getClass ("UIGestureRecognizer");
	__xamarin_class_map [112].handle = objc_getClass ("UITapGestureRecognizer");
	__xamarin_class_map [113].handle = objc_getClass ("UIImagePickerController");
	__xamarin_class_map [114].handle = objc_getClass ("UITextField");
	__xamarin_class_map [115].handle = objc_getClass ("UISearchBar");
	__xamarin_class_map [116].handle = objc_getClass ("UITabBar");
	__xamarin_class_map [117].handle = objc_getClass ("UIWebView");
	__xamarin_class_map [118].handle = [AppDelegate class];
	__xamarin_class_map [119].handle = [BaseVC class];
	__xamarin_class_map [120].handle = [HomeVC class];
	__xamarin_class_map [121].handle = [GradientView class];
	__xamarin_class_map [122].handle = [JD_iPhone_ExportTableSource class];
	__xamarin_class_map [123].handle = [ExportVC class];
	__xamarin_class_map [124].handle = [BaseCell class];
	__xamarin_class_map [125].handle = [CategoryCell class];
	__xamarin_class_map [126].handle = [ExportCell class];
	__xamarin_class_map [127].handle = [JD_iPhone_ResourceTableSource class];
	__xamarin_class_map [128].handle = [ResourcesVC class];
	__xamarin_class_map [129].handle = [JD_iPhone_AlertTableSource class];
	__xamarin_class_map [130].handle = [AlertVC class];
	__xamarin_class_map [131].handle = [AlertCell class];
	__xamarin_class_map [132].handle = [JD_iPhone_SettingsTableSource class];
	__xamarin_class_map [133].handle = [SettingsVC class];
	__xamarin_class_map [134].handle = [JD_iPhone_SearchTableSource class];
	__xamarin_class_map [135].handle = [SearchVC class];
	__xamarin_class_map [136].handle = [FileCell class];
	__xamarin_class_map [137].handle = [JD_iPhone_CategorySource class];
	__xamarin_class_map [138].handle = [CategoryVC class];
	__xamarin_class_map [139].handle = [SearchCell class];
	__xamarin_class_map [140].handle = [JD_iPhone_ProfileTableSource class];
	__xamarin_class_map [141].handle = [ProfileVC class];
	__xamarin_class_map [142].handle = [ProfileCell class];
	__xamarin_class_map [143].handle = [JD_iPhone_NotificationTableSource class];
	__xamarin_class_map [144].handle = [NotificationVC class];
	__xamarin_class_map [145].handle = [LoginVC class];
	__xamarin_class_map [146].handle = [CheckCell class];
	__xamarin_class_map [147].handle = [JD_iPhone_TableSource class];
	__xamarin_class_map [148].handle = [CategoryCollectionCell class];
	__xamarin_class_map [149].handle = [ThankyouVC class];
	__xamarin_class_map [150].handle = [OnboardingVC class];
	__xamarin_class_map [151].handle = [MainTapBarVC class];
	__xamarin_class_map [152].handle = [MainTabMenuVC class];
	__xamarin_class_map [153].handle = [JD_iPhone_SingleFileTableSource class];
	__xamarin_class_map [154].handle = [CategorySingleFileVC class];
	__xamarin_class_map [155].handle = [SingleCategoryCell class];
	__xamarin_class_map [156].handle = [CameraVC class];
	__xamarin_class_map [157].handle = [JD_iPhone_CEEditTableSource class];
	__xamarin_class_map [158].handle = [CEEditContentsVC class];
	__xamarin_class_map [159].handle = [JD_iPhone_CESaveTableSource class];
	__xamarin_class_map [160].handle = [CESaveContentsVC class];
	__xamarin_class_map [161].handle = [PhotoCroppingVC class];
	__xamarin_class_map [162].handle = [JD_iPhone_ResizingFrame class];
	__xamarin_class_map [163].handle = [RegistrationVC class];
	__xamarin_class_map [164].handle = [JD_iPhone_JobTableSource class];
	__xamarin_class_map [165].handle = [JD_iPhone_RoleTablesource class];
	__xamarin_class_map [166].handle = [SelectRoleVC class];
	__xamarin_class_map [167].handle = [JD_iPhone_SaveLocationSource class];
	__xamarin_class_map [168].handle = [SaveLocationVC class];
	__xamarin_class_map [169].handle = [JD_iPhone_LoadingOverlay class];
	__xamarin_class_map [170].handle = [CreateAccountJobVC class];
	__xamarin_class_map [171].handle = [JD_iPhone_ConfirmCategorySource class];
	__xamarin_class_map [172].handle = [JD_iPhone_ConfirmTableSource class];
	__xamarin_class_map [173].handle = [ConfirmInfoVC class];
	__xamarin_class_map [174].handle = [JD_iPhone_CategoryCollectionSource class];
	__xamarin_class_map [175].handle = [SelectCategoryVC class];
	__xamarin_class_map [176].handle = [JD_API_Job class];
	__xamarin_class_map [177].handle = [JD_iPhone_OutputRecorder class];
	__xamarin_class_map [178].handle = [SelectJobVC class];
	__xamarin_class_map [179].handle = [JD_iPhone_DocumentCell_ImageScrollDelegate class];
	__xamarin_class_map [180].handle = [DocumentCell class];
	__xamarin_class_map [181].handle = objc_getClass ("UIKit_UIAlertView__UIAlertViewDelegate");
	__xamarin_class_map [182].handle = objc_getClass ("UIKit_UIBarButtonItem_Callback");
	__xamarin_class_map [183].handle = objc_getClass ("__UIGestureRecognizerToken");
	__xamarin_class_map [184].handle = objc_getClass ("__UIGestureRecognizerParameterlessToken");
	__xamarin_class_map [185].handle = objc_getClass ("__UIGestureRecognizerParametrizedToken");
	__xamarin_class_map [186].handle = objc_getClass ("__UITapGestureRecognizer");
	__xamarin_class_map [187].handle = objc_getClass ("UIKit_UIImagePickerController__UIImagePickerControllerDelegate");
	__xamarin_class_map [188].handle = objc_getClass ("UIKit_UITextField__UITextFieldDelegate");
	__xamarin_class_map [189].handle = objc_getClass ("UIKit_UIView_UIViewAppearance");
	__xamarin_class_map [190].handle = objc_getClass ("UIKit_UISearchBar__UISearchBarDelegate");
	__xamarin_class_map [191].handle = objc_getClass ("__NSObject_Disposer");
	__xamarin_class_map [192].handle = objc_getClass ("UIKit_UIScrollView__UIScrollViewDelegate");
	__xamarin_class_map [193].handle = objc_getClass ("UIKit_UITabBar_UITabBarAppearance");
	__xamarin_class_map [194].handle = objc_getClass ("UIKit_UITabBarController__UITabBarControllerDelegate");
	__xamarin_class_map [195].handle = objc_getClass ("UIKit_UIWebView__UIWebViewDelegate");
	__xamarin_class_map [196].handle = [Xamarin_Controls__MobileServices_ProgressLabel class];
	__xamarin_class_map [197].handle = [Xamarin_Auth__MobileServices_FormAuthenticatorController_FormDelegate class];
	__xamarin_class_map [198].handle = [Xamarin_Auth__MobileServices_FormAuthenticatorController class];
	__xamarin_class_map [199].handle = [Xamarin_Auth__MobileServices_WebAuthenticatorController_WebViewDelegate class];
	__xamarin_class_map [200].handle = [Xamarin_Auth__MobileServices_WebAuthenticatorController class];
	__xamarin_class_map [201].handle = [Xamarin_Auth__MobileServices_FormAuthenticatorController_FieldCell class];
	__xamarin_class_map [202].handle = [Xamarin_Auth__MobileServices_FormAuthenticatorController_FormDataSource class];
	xamarin_add_registration_map (&__xamarin_registration_map);
}


