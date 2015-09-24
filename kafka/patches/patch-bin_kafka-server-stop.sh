$NetBSD$

More columns to make grep match.

--- bin/kafka-server-stop.sh.orig	2015-02-26 22:12:05.000000000 +0000
+++ bin/kafka-server-stop.sh
@@ -13,4 +13,4 @@
 # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 # See the License for the specific language governing permissions and
 # limitations under the License.
-ps ax | grep -i 'kafka\.Kafka' | grep java | grep -v grep | awk '{print $1}' | xargs kill -SIGTERM
+ps axwww | grep -i 'kafka\.Kafka' | grep java | grep -v grep | awk '{print $1}' | xargs kill -SIGTERM
