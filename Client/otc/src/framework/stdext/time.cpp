/*
 * Copyright (c) 2010-2017 OTClient <https://github.com/edubart/otclient>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#include "time.h"
#include <chrono>
#include <ctime>
#include <thread>

#ifdef __MINGW32__
#include <boost/thread.hpp>
#endif // __MINGW32__

namespace stdext {

const static auto startup_time = std::chrono::high_resolution_clock::now();

ticks_t time() {
    return std::time(NULL);
}

ticks_t millis()
{
    return std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::high_resolution_clock::now() - startup_time).count();
}
ticks_t micros() {
    return std::chrono::duration_cast<std::chrono::microseconds>(std::chrono::high_resolution_clock::now() - startup_time).count();
}

void millisleep(size_t ms)
{
    #ifdef __MINGW32__
        boost::this_thread::sleep(boost::posix_time::milliseconds(ms));
    #elif _MSC_VER
		std::this_thread::sleep_for(std::chrono::milliseconds(ms));     
    #else
		usleep(ms * 1000);
	#endif
};

void microsleep(size_t us)
{
    #ifdef __MINGW32__
        boost::this_thread::sleep(boost::posix_time::microseconds(us));
	#elif _MSC_VER
		std::this_thread::sleep_for(std::chrono::microseconds(us));
    #else
        usleep(us);
    #endif
};

}
