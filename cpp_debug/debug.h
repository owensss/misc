#ifndef _DEBUG_HPP_
#define _DEBUG_HPP_

#include <cassert>

#ifndef NDEBUG
#include <iostream>
#define DMESG(x) st_DEBUG_HPP_d::cerr << "[DBG]" << x << std::endl;

namespace detail {
	template <typename T>
		inline void LOG(const T& t) {
			std::cerr << t << std::endl;
		}

	template <typename T, typename T2>
		inline void LOG(const T& _1, const T2& _2) {
			std::cerr << _1 << " = " << _2 << std::endl;
		}

	template <typename T, typename T2, typename... Args>
		inline void LOG(const T& _1, const T2& _2, const Args&... p) {
			std::cerr << _1 << " = " << _2 << ", ";
			detail::LOG(p...);
		}
}

template <typename M, typename... Args>
	inline void LOG(const M& msg, const Args&... p) {
		std::cerr << "[" << msg << "] ";
		detail::LOG(p...);
	}

template <typename M>
	inline void LOG(const M& msg) {
		std::cerr << "[" << msg << "]" << std::endl;
	}

#else

#define DMESG(x) ;
template <typename... Args>
	inline void LOG(const Args& ...) {};

#endif // NDEBUG
#endif // DEBUG_H

